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

SIPRamal ramal = SIPRamalFacade.getSipRamal(requestId);

String id = "";
String callerid = "";
String type = "";
String username = "";
String secret = "";
String canreinvite = "";
String host = "";
String context = "";
String dtmfmode = "";
String call_limit = "";
String nat = "";
if(ramal != null){
	id = ramal.getId();
	callerid = ramal.getCallerid();
	type = ramal.getType();
	username = ramal.getUsername();
	secret = ramal.getSecret();
	canreinvite = ramal.getCanreinvite();
	host = ramal.getHost();
	context = ramal.getContext();
	dtmfmode = ramal.getDtmfmode();
	call_limit = ramal.getCall_limit();
	nat = ramal.getNat();
}
%>
<div id="crud" class="grid col-three-quarters mq2-col-full">
	<h1>[<%=id%>]</h1>
	<form method="post" id="sipRamal">
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
				<h4>username:</h4> 
				<input type="text" name="username" value="<%=username%>">
			</li>
			<li>
				<h4>secret:</h4> 
				<input type="text" name="secret" value="<%=secret%>">
			</li>
			<li>
				<h4>canreinvite:</h4> 
				<input type="checkbox" name="canreinvite" <%if("yes".equals(canreinvite)){%>checked="checked"<%}%>>
			</li>
			<li>
				<h4>host:</h4> 
				<input type="text" name="host" value="<%=host%>">
			</li>
			<li>
				<h4>context:</h4> 
				<input type="text" name="context" value="<%=context%>">
			</li>
			<li>
				<h4>dtmfmode:</h4> 
				<input type="text" name="dtmfmode" value="<%=dtmfmode%>">
			</li>
			<li>
				<h4>call_limit:</h4> 
				<input type="text" name="call_limit" value="<%=call_limit%>">
			</li>
			<li>
				<h4>nat:</h4>
				<input type="checkbox" name="nat" <%if("yes".equals(nat)){%>checked="checked"<%}%>>	
			</li>
			<li>
				<button type="submit" name="action" value="sipRamalSalvar" class="button fright">Salvar</button>
				<button type="submit" name="action" value="sipRamalDeletar" class="button fright">Deletar</button>
			</li>
		</ul>
	</form>
</div>