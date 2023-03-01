<%@page import="org.json.JSONObject"%>
<%
    String jsonRespuestas = request.getParameter("respuestaEstudiante");
    JSONObject json = new JSONObject();
    json.put("x", jsonRespuestas);
    out.println(json);

%>