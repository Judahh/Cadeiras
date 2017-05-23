<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<jsp:include page="framework/frameworkUp.jsp"/>
<%@page import="java.net.InetAddress;" %>
<div class="home-page main">
	<section class="grid-wrap" >
		<header class="grid col-full">
			<hr><p class="fleft">QR Code</p>
		</header>

		<div class="grid col-full mq2-col-full">
			<img id="qrcode" src="http://qrfree.kaywa.com/?s=8&d=http%3A%2F%2F<%=InetAddress.getLocalHost().getHostAddress()%>%3A8080%2FR2" alt="QRCode"/>
		</div>
	</section>
</div>
<jsp:include page="framework/frameworkDown.jsp"/>