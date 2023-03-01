 <%@page import="General.Mensajes"%>
<%
    if(session.getAttribute("errorNumber") != null){
%>
        <div class="alert alert-danger" role="alert">
            <%= new Mensajes().GetErrorMessage((int)session.getAttribute("errorNumber")) %>
        </div>
<%
    }
%>