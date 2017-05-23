<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<aside class="grid col-one-quarter mq2-col-full">
	<p>Ramais:</p>
	<form method="post">
		<input type="hidden" name="action" value="ramalCrud">
		<menu>
			<ul>
				<%
				for(SIPRamal ramal : SIPRamalFacade.getSipRamais()){
				%>
				<li>
					<button type="submit" name="id" class="button" value="<%=ramal.getId()%>"><%=ramal.getId()%></button>
				</li>
				<%
				}
				%>
				<li>
					<button type="submit" name="id" class="button">+</button>
				</li>
			</ul>	
		</menu>
	</form>
</aside>