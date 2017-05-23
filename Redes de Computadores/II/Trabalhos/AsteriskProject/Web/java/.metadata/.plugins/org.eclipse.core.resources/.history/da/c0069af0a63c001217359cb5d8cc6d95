<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<%
	//Params
String requestId = request.getParameter("id");
if(requestId == null || requestId.isEmpty()){
	requestId = "";
}

IAXRamal ramal = IAXRamalFacade.getIaxRamal(requestId);

String id = "";
String callerid = "";
String type = "";
String defaultuser = "";
String secret = "";
String context = "";
String host = "";
String auth = "";
String transfer = "";
String requiredcalltoken = "";

if(ramal != null){
	id = ramal.getId();
	callerid = ramal.getCallerid();
	type = ramal.getType();
	defaultuser = ramal.getDefaultuser();
	secret = ramal.getSecret();
	context = ramal.getContext();
	host = ramal.getHost();
	auth = ramal.getAuth();
	transfer = ramal.getTransfer();
	requiredcalltoken = ramal.getRequiredcalltoken();
}
%>
<div id="crud" class="grid col-three-quarters mq2-col-full">
	<h1>[<%=id%>]</h1>
	<form method="post" id="iaxRamal">
		<input type="hidden" name="id" value="<%=id%>">
		<ul>
			<li>
				<h4>id:</h4> 
				<input type="text" name="newId" value="<%=id%>">
			</li>
			<li>
				<h4>callerid:</h4> 
				<input type="text" name="callerid" value="<%=callerid%>">
			</li>
			<li>
				<h4>type:</h4> 
				<input type="text" name="type" value="<%=type%>">
			</li>
			<li>
				<h4>defaultuser:</h4> 
				<input type="text" name="defaultuser" value="<%=defaultuser%>">
			</li>
			<li>
				<h4>secret:</h4> 
				<input type="text" name="secret" value="<%=secret%>">
			</li>
			<li>
				<h4>context:</h4> 
				<input type="text" name="context" value="<%=context%>">
			</li>
			<li>
				<h4>host:</h4> 
				<input type="text" name="host" value="<%=host%>">
			</li>
			<li>
				<h4>auth:</h4> 
				<input type="text" name="auth" value="<%=auth%>">
			</li>
			<li>
				<h4>transfer:</h4> 
				<input type="checkbox" name="transfer" <%if("yes".equals(transfer)){%>checked="checked"<%}%>>
			</li>
			<li>
				<h4>requiredcalltoken:</h4> 
				<input type="checkbox" name="requiredcalltoken" <%if("yes".equals(requiredcalltoken)){%>checked="checked"<%}%>>
			</li>
			<li>
				<button type="submit" name="action" value="iaxRamalSalvar" class="button fright">Salvar</button>
				<button type="submit" name="action" value="iaxRamalDeletar" class="button fright">Deletar</button>
			</li>
		</ul>
	</form>
</div>