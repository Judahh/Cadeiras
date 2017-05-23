package org.apache.jsp.basic;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import redes2.*;
import redes2.facade.*;
import model.*;
import util.*;
import util.imp.*;
import util.interfaces.*;
import view.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<header id=\"navtop\">\n");
      out.write("\t<a href=\"index.jsp\">\n");
      out.write("\t\t<img class=\"logo fleft\" src=\"img/asterix.jpg\" />\n");
      out.write("\t</a>\n");
      out.write("\n");
      out.write("\t<nav class=\"fright\">\n");
      out.write("\t\t<ul>\n");
      out.write("\t\t\t<li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("\t\t\t<li><a href=\"sipIndex.jsp\">SIP</a></li>\n");
      out.write("\t\t\t<li><a href=\"iaxIndex.jsp\">IAX</a></li>\n");
      out.write("\t\t\t<li><a href=\"extIndex.jsp\">Extensions</a></li>\n");
      out.write("\t\t\t<li><a href=\"monIndex.jsp\">Monitor</a></li>\n");
      out.write("\t\t\t<li><a href=\"agentIndex.jsp\">Agent</a></li>\n");
      out.write("\t\t\t<li><a href=\"queueIndex.jsp\">Queue</a></li>\n");
      out.write("\t\t\t<li><a href=\"qrCodeIndex.jsp\">QR Code</a></li>\n");
      out.write("\t\t</ul>\n");
      out.write("\t</nav>\n");
      out.write("\t<!-- Javascript - jQuery -->\n");
      out.write("\t<script src=\"js/jquery-1.8.2.js\"></script>\n");
      out.write("\t<script src=\"js/jquery.qrcode.min.js\"></script>\n");
      out.write("\t<script src=\"js/jquery.flexslider-min.js\"></script>\n");
      out.write("\t<script src=\"js/scripts.js\"></script>\n");
      out.write("</header>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
