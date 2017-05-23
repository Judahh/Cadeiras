<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<%
	//Action
String action = request.getParameter("action");
if(action != null && !action.isEmpty()){
	if ("agentDeletar".equals(action)) {
		AgentFacade.deleteAgent(request.getParameter("id"));
	} else if ("agentSalvar".equals(action)) {
		String id = request.getParameter("id");
		String newId = request.getParameter("newId");
		String secret = request.getParameter("secret");
		String username = request.getParameter("username");
		AgentFacade.updateAgent(id, new Agent(newId,secret,username));
	}
}
%>