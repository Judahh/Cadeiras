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

EXTContext context = EXTContextFacade.getExtContextIaxRamal(requestId);

String id = "";

if(context != null){
	id = context.getId();
}
%>
<div id="crud" class="grid col-three-quarters mq2-col-full">
	<h1>[<%=id%>]</h1>
	<form method="post" id="extContext">
		<input type="hidden" name="id" value="<%=id%>">
		<ul>
			<li>
				<h4>id:</h4> 
				<input type="text" name="newId" value="<%=id%>">
			</li>
		</ul>
		<%
		if(context != null){
			ArrayList<EXTContextNumber> contextNumber = context.getNumber();
				if(contextNumber != null){
			for(EXTContextNumber number : contextNumber){
				String num = number.getNumber();
				if(num != null && !num.isEmpty()){
		%>
			<div class="boxExtension">
			<ul>
				<li>
					<h2><%=num%></h2> 
					<h4>N�mero:</h4> 
					<input type="text" name="number//<%=id%>" value="<%=num%>">
				</li>
				<%
				for(String command : number.getCommands()){
				%>
				<li>
					<h4>Comando:</h4>
					<input type="text" name="command<%="//"+id+"//"+num%>" value="<%=command%>">
				</li>
				<%}%>
				<li>
					<h4>Utilize para adicionar um novo comando:</h4> 
					<input type="text" name="command<%="//"+id+"//"+num%>">
				</li>
			<li>
				<button type="submit" name="action" value="extContextSalvar" class="button">+</button>
			</li>
			</ul>
			</div>
		<%
				}
			}
		}
		}
		%>
		
		<div class="boxExtension">
		<ul>
			<li>
				<h2>Utilize para adicionar um novo n�mero.</h2> 
				<h4>N�mero:</h4> 
				<input type="text" name="number//NOVO_NUMERO" value="">
			</li>
			<%
			for(int i = 0 ; i < 3 ; i++){%>
			<li>
				<h4>Comando:</h4> 
				<input type="text" name="command<%="//"+id+"//NOVO_NUMERO"%>">
			</li>
			<%}%>
			<li>
				<button type="submit" name="action" value="extContextSalvar" class="button">+</button>
			</li>
		</ul>
		</div>
		
		<ul>
			<li>
				<button type="submit" name="action" value="extContextSalvar" class="button fright">Salvar</button>
				<!-- <button type="submit" name="action" value="extContextDeletar" class="button fright">Deletar</button> -->
			</li>
		</ul>
	</form>
</div>