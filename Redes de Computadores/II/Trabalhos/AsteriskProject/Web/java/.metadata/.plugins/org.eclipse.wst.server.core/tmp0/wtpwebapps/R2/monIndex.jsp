<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<jsp:include page="framework/frameworkUp.jsp"/>
<div class="home-page main">
	<section class="grid-wrap">
		<header class="grid col-full">
			<hr><p class="fleft">Monitor</p>
		</header>
		<div id="reload">
			<jsp:include page="mon/monInfo.jsp"/>
		</div>
		<script type="text/javascript">
			window.location.hash="info";
		</script>
	</section>
</div>
<jsp:include page="framework/frameworkDown.jsp"/>