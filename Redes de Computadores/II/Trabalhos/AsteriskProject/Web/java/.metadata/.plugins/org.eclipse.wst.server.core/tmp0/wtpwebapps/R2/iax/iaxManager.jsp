<%@page import="java.util.*"%>
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
	if ("iaxRamalDeletar".equals(action)) {
		IAXRamalFacade.deleteIaxRamal(request.getParameter("id"));
	} else if ("iaxRamalSalvar".equals(action)) {
		String id = request.getParameter("id");
		String newId = request.getParameter("newId");
		String callerid = request.getParameter("callerid");
		String type = request.getParameter("type");
		String defaultuser = request.getParameter("defaultuser");
		String secret = request.getParameter("secret");
		String context = request.getParameter("context");
		String host = request.getParameter("host");
		String auth = request.getParameter("auth");
		String transfer = "";
		if(request.getParameter("transfer") == null){
			transfer = "no";
		}else{
			transfer = "yes";
		}
		String requiredcalltoken = "";
		if(request.getParameter("requiredcalltoken") == null){
			requiredcalltoken = "no";
		}else{
			requiredcalltoken = "yes";
		}
		IAXRamalFacade.updateIaxRamal(id, new IAXRamal(newId, callerid, type, defaultuser, secret, context, host, auth, transfer, requiredcalltoken));
	}
}
%>