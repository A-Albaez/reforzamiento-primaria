<%@page import="org.json.JSONObject"%>
<%@page import="Entidades.Respuestas"%>
<%@page import="Entidades.Preguntas"%>
<%@page import="Entidades.Temas"%>
<%@page import="Procesos.Jugabilidad"%>
<%@include file="view/template/header2.jsp" %>
<!-- Page Content-->
<!--<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jugando</title>
    </head>-->
<div class="cuerpo">
    <section class="pt-4">
        <div class="container px-lg-5">
            <%
                Jugabilidad jugabilidad = new Jugabilidad();
                Temas tema = jugabilidad.ObtenerTemaCompleto("TCN03-1");
            %>
            <h2><%= tema.getNombre_tema()%></h2>
            <p><%= tema.getContenido()%></p>

            <button id="btnIniciarJuego" onclick="iniciarJuego()" class="btn btn-success btn-block mt-5 mb-5 w-100">INICIAR JUEGO</button>

            <form action="procesos/juego/saveRespuestas.jsp" method="post">
                <input type="hidden" id="txtRespuestas" name="respuestaEstudiante" />
                <button id="btnFinalizarJuego" type="submit" class="btn btn-warning btn-block mt-5 mb-5 w-100 d-none">FINALIZAR JUEGO</button>
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
            <%--<div id="accordion" class="pb-5">
                <%for(Preguntas pregunta : tema.getPreguntas()){%>
                <div class="card">
                  <div class="card-header" id="headingOne<%= pregunta.getCod_preg() %>">
                    <h5 class="mb-0">
                      <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne<%= pregunta.getCod_preg() %>" aria-expanded="true" aria-controls="collapseOne<%= pregunta.getCod_preg() %>">
                       <%= pregunta.getPregunta() %>
                      </button>
                    </h5>
                  </div>

              <div id="collapseOne<%= pregunta.getCod_preg() %>" class="collapse show" aria-labelledby="headingOne<%= pregunta.getCod_preg() %>" data-parent="#accordion">
                <div class="card-body">
                    <div class="row">
                        <% for(Respuestas respuesta : pregunta.getRespuestas()){ %>
                        <div class="col-3">
                            <input type="radio" class="form-check" name="resp_<%= pregunta.getCod_preg() %>" value="<%= respuesta.getId_opc() %>" />
                            <label><%= respuesta.getOpc_resp()%></label>
                        </div>
                        <%}%>
                    </div>
                </div>
              </div>
            </div>
            <%}%>
          </div>--%>

        </div>
    </section>
    <script>

        let tema = <%= tema.toJson()%>;
        let respuestaEstudiante = [];
        function iniciarJuego() {
            var btn = document.getElementById("btnIniciarJuego");
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
                html += "<div class='col-3'>";
                html += '<input type="radio" class="form-check" name="resp_' + primeraPregunta.cod_pregunta + '" value="' + respuestas.ident_opcion + '" />';
                html += '<label>' + respuestas.opcion_resp + '</label>';
                html += "</div>"
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
                                        pts_obtenidos: -2,
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
                    var btn = document.getElementById("btnFinalizarJuego");
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
                html += "<div class='col-3'>";
                html += '<input type="radio" class="form-check" name="resp_' + pregunta.cod_pregunta + '" value="' + respuestas.ident_opcion + '" />';
                html += '<label>' + respuestas.opcion_resp + '</label>';
                html += "</div>"
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
</div>
<%@include file="view/template/footer2.jsp" %>