<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>

<table border="1" class="tableMonitor">
<tr>
<th>Membro</th><th>Status</th>
</tr>
<%

List<List<String>> fromInterface = MonitorFacade.getQueues();
for(List<String> listInterface : fromInterface){
	
	%>
	<tr>	
	<%
	for(String str : listInterface){
		%>
		<td>	
		<%=str%>
		</td>
		<%
	}
	%>
	</tr>
	<%
}
%>
</table>
