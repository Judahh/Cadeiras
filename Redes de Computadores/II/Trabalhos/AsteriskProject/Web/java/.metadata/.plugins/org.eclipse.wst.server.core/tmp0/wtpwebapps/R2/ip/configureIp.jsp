<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<%
String ip = request.getParameter("ip");
if (ip == null) {
	Object ipObj = session.getAttribute("ip");
	if (ipObj == null) {
		ip = "";
	} else {
		ip = ipObj.toString();
	}
}
session.setAttribute("ip", ip);

String porta = request.getParameter("porta");
if (porta == null) {
	Object portaObj = session.getAttribute("porta");
	if (portaObj == null) {
		porta = "";
	} else {
		porta = portaObj.toString();
	}
}
session.setAttribute("porta", porta);
%>
<div class="box fleft">
<h4>Ip do servidor</h4>
<form method="post"> 
	<input type="text" class="ip" name ="ip" value="<%=ip%>" placeholder="Ex: 10.255.0.101">
	<input type="text" class="porta" name ="porta" value="<%=porta%>" placeholder="Ex: 22">
	<button type="submit" value="atualizar">Atualizar</button>
</form>
</div>