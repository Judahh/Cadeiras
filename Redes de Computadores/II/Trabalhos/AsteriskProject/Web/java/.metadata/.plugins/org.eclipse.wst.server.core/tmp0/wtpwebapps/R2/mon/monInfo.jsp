<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<%
boolean refresh = false;
if(request.getParameter("refreshReq") == null){
	refresh = false;
}else{
	refresh = true;
}
%>
<div id="info" class="grid col-three-quarters mq2-col-full">
	<form method="post" id="atualizar">
		<input type="checkbox" name="refreshReq" <%if(refresh){%>checked="checked"<%}%>>Atualizar Automaticamente
		<br>
		<button type="submit" name="action">Salvar</button>
		<br>
		<h4>Sip:</h4>
		<jsp:include page="monInfoSip.jsp"/>
		<br>
		<h4>Iax:</h4>
		<jsp:include page="monInfoIax.jsp"/>
		<br>
		<h4>Agents:</h4>
		<jsp:include page="monInfoAgents.jsp"/>
		<br>
		<h4>Core Show Channels:</h4>
		<jsp:include page="monInfoCore.jsp"/>
		<br>
		<h4>Queues:</h4>
		<jsp:include page="monInfoQueue.jsp"/>
		<br>
		<button type="submit" name="action">Atualizar</button>
	</form>
</div>
<%

if(refresh){
%>
	<script> 
	var auto_refresh = setInterval(
	function()
	{
	$('#atualizar').submit();
	}, 5000);
	</script>
<% 
}
%>