<%-- 
    Document   : Jugar
    Created on : 11/29/2021, 02:53:40 PM
    Author     : Adrian Albaez
--%>
<%@page import="org.json.JSONObject"%>
<%@page import="Entidades.Respuestas"%>
<%@page import="Entidades.Preguntas"%>
<%@page import="Entidades.Temas"%>
<%@page import="Procesos.Jugabilidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="view/template/header2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/StyleJugabilidad.css" rel="stylesheet" type="text/css"/>
        <title>Jugando</title>
    </head>
    <body>
        <div class="cuerpo">
            <%
                Jugabilidad jugabilidad = new Jugabilidad();
                Temas tema = jugabilidad.ObtenerTemaCompleto("TCN03-1");
            %>
            <section class="cajaJuego">
                <div class="titulo">
                    <h1><%= tema.getNombre_tema()%></h1>
                    <p><%= tema.getContenido()%></p>
                    <!-- <h1>EL CICLO DEL AGUA</h1> -->
                    <button id="BtSiguiente" onclick="iniciarJuego()" class="btn btn-success btn-block mt-5 mb-5 w-100">INICIAR JUEGO</button>

                    <form action="procesos/juego/saveRespuestas.jsp" method="post">
                        <input type="hidden" id="txtRespuestas" name="respuestaEstudiante" />
                        <button id="BtAnterior" type="submit" class="btn btn-warning btn-block mt-5 mb-5 w-100 d-none">FINALIZAR JUEGO</button>
                    </form>
                    <div id="accordion" class="pb-5 d-none">
                        <div class="card">
                            <div class="card-header" id="">
                                <h5 class="mb-0">
                                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <span id="pregunta"></span>
                                    </button>
                                    <!--img id="imgPreg" src="src" alt="alt"/-->
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="row" id="renderRespuestas">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <script>

                        let tema = <%= tema.toJson()%>;
                        let respuestaEstudiante = [];
                        function iniciarJuego() {
                        var btn = document.getElementById("BtSiguiente");
                        btn.classList.add("d-none");
                        MostarPrimeraPregunta(tema.preguntas[0]);
                        var acordion = document.getElementById("accordion");
                        acordion.classList.remove("d-none");
                        }



                        function MostarPrimeraPregunta(primeraPregunta) {
                        var preg = document.getElementById("pregunta");
                        preg.textContent = primeraPregunta.pregunta;
                        var render = document.getElementById("renderRespuestas");
                        var html = "";
                        primeraPregunta.respuestas.forEach(respuestas => {
                        html += "<div class='CajaPregunta'>";
                        html += '<input type="radio" class="form-check" name="resp_' + primeraPregunta.cod_pregunta + '" value="' + respuestas.ident_opcion + '" />';
                        html += '<label>' + respuestas.opcion_resp + '</label>';
                        html += "</div>";
                        });
                        html += '<button onclick="ValidarRespuesta(' + primeraPregunta.cod_pregunta + ')" class="btn btn-primary text-center col-12">Validar</button>'
                                render.innerHTML = html
                        }


                        function ValidarRespuesta(cod_pregunta) {
                        var respuesta = document.querySelector('input[name="resp_' + cod_pregunta + '"]:checked');
                        if (respuesta != null) {
                        tema.preguntas.forEach(p => {
                        if (p.cod_pregunta == cod_pregunta) {
                        p.respuestas.forEach(resp => {
                        if (resp.ident_opcion == respuesta.value) {
                        if (respuesta.respuesta == "C") {
                        alert("Respuesta correcto");
                        respuestaEstudiante.push({
                        cod_pregunta: cod_pregunta,
                                pts_obtenidos: 1,
                                fecha: new Date().toISOString()
                        });
                        } else {
                        alert(resp.retroalimentacion);
                        respuestaEstudiante.push({
                        cod_pregunta: cod_pregunta,
                                pts_obtenidos: - 2,
                                fecha: new Date().toISOString()
                        });
                        }
                        }
                        });
                        }
                        });
                        var esUltimaPregunta = ValidarUltimaPregunta(cod_pregunta);
                        if (!esUltimaPregunta) {
                        MostrarSiguientePregunta(cod_pregunta);
                        } else {
                        alert("Completo el cuestionario");
                        var btn = document.getElementById("BtAnterior");
                        btn.classList.remove("d-none");
                        var acordion = document.getElementById("accordion");
                        acordion.classList.add("d-none");
                        var txt = document.getElementById("txtRespuestas");
                        txt.value = JSON.stringify(respuestaEstudiante);
                        }
                        } else {
                        alert("debe seleccionar 1 respuesta");
                        }
                        }

                        function MostrarSiguientePregunta(cod_pregunta) {
                        var indicePregActual = tema.preguntas.indexOf(tema.preguntas.filter(cp => {
                        return cp.cod_pregunta == cod_pregunta
                        })[0]);
                        var indiceSigPreg = indicePregActual + 1;
                        if (indiceSigPreg <= tema.preguntas.length - 1) {
                        MostrarPregunta(indiceSigPreg);
                        } else {
                        MostrarPregunta(indicePregActual);
                        }
                        }
                        
                     
                        function MostrarPregunta(indice) {

                        var pregunta = tema.preguntas[indice];
                        var preg = document.getElementById("pregunta");
                        preg.textContent = pregunta.pregunta;
                        var render = document.getElementById("renderRespuestas");
                        var html = "";
                        pregunta.respuestas.forEach(respuestas => {
                        html += "<div class='CajaPregunta'>";
                        html += '<input type="radio" class="form-check" name="resp_' + pregunta.cod_pregunta + '" value="' + respuestas.ident_opcion + '" />';
                        html += '<label>' + respuestas.opcion_resp + '</label>';
                        html += "</div>";
                        });
                        html += '<button onclick="ValidarRespuesta(' + pregunta.cod_pregunta + ')" class="btn btn-primary text-center col-12">Validar</button>'
                                render.innerHTML = html
                        }

                        

                        function ValidarUltimaPregunta(cod_pregunta) {
                        var indicePregActual = tema.preguntas.indexOf(tema.preguntas.filter(cp => {
                        return cp.cod_pregunta == cod_pregunta
                        })[0]);
                        if (indicePregActual == tema.preguntas.length - 1) {
                        return true;
                        }
                        return false;
                        }

                    </script>







                    <!-- comment
                   
                    
                                          
                    
                    
                    
              
                    
                    
                    <div class="respuestas">
                        <form class="Elegeir respuesta">
                            <div class="prueba">
                                <label><input type="radio" name="respuesta" value="Incorrecta"> A- Condensación.</label><br>
                                <label><input type="radio" name="respuesta" value="Correcta"> B- Inspiración.</label><br>
                                <label><input type="radio" name="respuesta" value="Incorrecta"> C- Evaporación.</label><br>
                                <label><input type="radio" name="respuesta" value="Incorrecta"> D-
                                    Precipitación.</label><br>
                            </div>
                            <button id="BtAnterior">ANTERIOR</button>
                            <button id="BtSiguiente">SIGUIENTE</button>
                        </form>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <div class="CajaPregunta">
                        <div class="preguntas">
                            <h3>2¿Cuál de estas opciones no pertenece al ciclo del agua?</h3>
                            <div id="imgPregunta">
                                <nav>
                                    <ul>
                                        <li><a><img id="ImgPregunta" src="Imagenes/que es el ciclo del agua.webp"
                                                    alt=""></a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="respuestas">
                        <form class="Elegeir respuesta">
                            <div class="prueba">
                                <label><input type="radio" name="respuesta" value="Incorrecta"> A- Condensación.</label><br>
                                <label><input type="radio" name="respuesta" value="Correcta"> B- Inspiración.</label><br>
                                <label><input type="radio" name="respuesta" value="Incorrecta"> C- Evaporación.</label><br>
                                <label><input type="radio" name="respuesta" value="Incorrecta"> D-
                                    Precipitación.</label><br>
                            </div>
                            <button id="BtAnterior">ANTERIOR</button>
                            <button id="BtSiguiente">SIGUIENTE</button>
                        </form>
                    </div>
                </div>
        </div>
                    -->
            </section>

        </div>
    </body>
</html>
<%@include file="view/template/footer2.jsp" %>
