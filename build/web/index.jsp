<%-- 
    Document   : index
    Created on : 11/29/2021, 02:51:04 PM
    Author     : Adrian Albaez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/view/template/success.jsp" %>
        <%@include file="/view/template/error.jsp" %>
        <h1>Hello World!</h1>
        <div class="RegistrarYRcontraseña">
                    <nav>
                        <ul>
                               <li><a href="Jugar.jsp">Registrarse</a></li>
                               <li><a href="juego.jsp" class="Jugar">JUGAR</a></li>
                        </ul>
                    </nav>
                </div>
    </body>
</html>
