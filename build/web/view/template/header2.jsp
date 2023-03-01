<%-- 
    Document   : header
    Created on : 16-nov-2021, 17:02:34
    Author     : hhern
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jugando</title>
        <link href="css/StyleJugabilidad.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
            <header>
        <section class="cajaHeader">
            <div class="logo">
                <img src="Imagenes/logoprueba.png" alt="">
            </div>
            <div class="barra">
                <nav>
                    <ul>
                        <li><a href="html/paginaprincipal.html">Inicio</a></li>
                        <li><a href="html/Aprendizaje.html">Temas</a></li>
                        <li><a href="html/ReportesGenerales.html">Reportes Generales</a></li>
                        <li><a href="html/about.html">Sobre Nosotros</a></li>
                        <li><a href="html/Contacto.html">Contacto</a></li>
                        <div class="select2">
                            <label for="Reportes" id="Reportes"></label>
                            <select name="Reportes">
                                <option selected="otros">Otros</option>
                                <option value="Tema 1">Contenido añadido</option>
                                <option value="Tema 2">Añadir contenido</option>
                            </select>
                        </div>
                    </ul>
                </nav>
            </div>
        </section>
        <div class="Buscar">
            <input type="text" placeholder="  Busqueda" required class="srcB">
        </div>
        <div class="CerrarYnombre">
            <nav>
                <ul>
                    <li><a href="">nombre User</a></li>
                    <li><a href="html/login.html">Cerrar Sesión</a></li>
                </ul>
            </nav>
        </div>
        <div class="IconoUser">
            <nav>
                <ul>
                    <li>
                        <a href="html/perfiluser.html"><img src="Imagenes/userS1.png" alt=""></a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    </body>
</html>
