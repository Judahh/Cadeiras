<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<header id="navtop">
	<a href="index.jsp">
		<img class="logo fleft" src="img/asterix.jpg" />
	</a>

	<nav class="fright">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="sipIndex.jsp">SIP</a></li>
			<li><a href="iaxIndex.jsp">IAX</a></li>
			<li><a href="extIndex.jsp">Extensions</a></li>
			<li><a href="monIndex.jsp">Monitor</a></li>
			<li><a href="agentIndex.jsp">Agent</a></li>
			<li><a href="queueIndex.jsp">Queue</a></li>
			<li><a href="qrCodeIndex.jsp">QR Code</a></li>
		</ul>
	</nav>
	<!-- Javascript - jQuery -->
	<script src="js/jquery-1.8.2.js"></script>
	<script src="js/jquery.qrcode.min.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
	<script src="js/scripts.js"></script>
</header>