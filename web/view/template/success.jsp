 <%@page import="General.Mensajes"%>
<%
    if(session.getAttribute("number") != null){
%>
        <div class="alert alert-success" role="alert">
            <%= new Mensajes().GetSuccessMessage((int)session.getAttribute("number")) %>
        </div>
<%
    }
%>