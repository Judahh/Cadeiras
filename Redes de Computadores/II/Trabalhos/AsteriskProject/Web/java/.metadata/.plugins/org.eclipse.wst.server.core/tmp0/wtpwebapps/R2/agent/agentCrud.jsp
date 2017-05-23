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

Agent agent = AgentFacade.getAgent(requestId);

String id = "";
String secret = "";
String username = "";
if(agent != null){
	id = agent.getId();
	secret = agent.getSecret();
	username = agent.getUsername();
}
%>
<div id="crud" class="grid col-three-quarters mq2-col-full">
	<h1>[<%=id%>]</h1>
	<form method="post" id="agent">
		<input type="hidden" name="id" value="<%=id%>">
		<ul>
			<li>
				<h4>id:</h4> 
				<input type="text" name="newId" value="<%=id%>">
			</li>
			<li>
				<h4>secret:</h4> 
				<input type="text" name="secret" value="<%=secret%>">
			</li>
			<li>
				<h4>username:</h4> 
				<input type="text" name="username" value="<%=username%>">
			</li>
			<li>
				<button type="submit" name="action" value="agentSalvar" class="button fright">Salvar</button>
				<button type="submit" name="action" value="agentDeletar" class="button fright">Deletar</button>
			</li>
		</ul>
	</form>
</div>