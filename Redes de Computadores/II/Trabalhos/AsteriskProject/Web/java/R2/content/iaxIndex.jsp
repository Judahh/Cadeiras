<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<jsp:include page="framework/frameworkUp.jsp"/>
<jsp:include page="iax/iaxManager.jsp"/>
<div class="home-page main">
	<section class="grid-wrap">
		<header class="grid col-full">
			<hr><p class="fleft">Configurar IAX</p>
		</header>
		<jsp:include page="iax/iaxLista.jsp"/>
		<jsp:include page="iax/iaxRamalCrud.jsp"/>
		<script type="text/javascript">
			window.location.hash="crud";
		</script>
	</section>
</div>
<jsp:include page="framework/frameworkDown.jsp"/>