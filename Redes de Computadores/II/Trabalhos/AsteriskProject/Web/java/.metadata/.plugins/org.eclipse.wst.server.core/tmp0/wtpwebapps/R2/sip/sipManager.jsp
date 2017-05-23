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
	if ("sipRamalDeletar".equals(action)) {
		SIPRamalFacade.deleteSipRamal(request.getParameter("id"));
	} else if ("sipRamalSalvar".equals(action)) {
		String id = request.getParameter("id");
		String newId = request.getParameter("newId");
		String callerid = request.getParameter("callerid");
		String type = request.getParameter("type");
		String username = request.getParameter("username");
		String secret = request.getParameter("secret");
		String canreinvite = null;
		if(request.getParameter("canreinvite") == null){
			canreinvite = "no";
		}else{
			canreinvite = "yes";
		}
		String host = request.getParameter("host");
		String context = request.getParameter("context");
		String dtmfmode = request.getParameter("dtmfmode");
		String call_limit = request.getParameter("call_limit");
		String nat = null;
		if(request.getParameter("nat") == null){
			nat = "no";
		}else{
			nat = "yes";
		}
		SIPRamalFacade.updateSipRamal(id, new SIPRamal(newId, callerid, type, username,secret,canreinvite,host, context, dtmfmode, call_limit, nat));
	}
}
%>