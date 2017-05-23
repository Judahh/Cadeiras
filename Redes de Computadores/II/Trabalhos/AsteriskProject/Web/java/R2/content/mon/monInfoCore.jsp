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
<th>Channel</th><th>BridgedChannel</th><th>Application</th><th>Duration</th>
</tr>
<%

List<List<String>> fromInterface = MonitorFacade.getCoreShow();
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
