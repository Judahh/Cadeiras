package org.apache.jsp.mon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import redes2.*;
import redes2.facade.*;
import model.*;
import util.*;
import util.imp.*;
import util.interfaces.*;
import view.*;

public final class monInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");

boolean refresh = false;
if(request.getParameter("refreshReq") == null){
	refresh = false;
}else{
	refresh = true;
}

      out.write("\n");
      out.write("<div id=\"info\" class=\"grid col-three-quarters mq2-col-full\">\n");
      out.write("\t<form method=\"post\" id=\"atualizar\">\n");
      out.write("\t\t<input type=\"checkbox\" name=\"refreshReq\" ");
if(refresh){
      out.write("checked=\"checked\"");
}
      out.write(">Atualizar Automaticamente\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<button type=\"submit\" name=\"action\">Salvar</button>\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<h4>Sip:</h4>\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "monInfoSip.jsp", out, false);
      out.write("\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<h4>Iax:</h4>\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "monInfoIax.jsp", out, false);
      out.write("\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<h4>Agents:</h4>\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "monInfoAgents.jsp", out, false);
      out.write("\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<h4>Core Show Channels:</h4>\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "monInfoCore.jsp", out, false);
      out.write("\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<h4>Queues:</h4>\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "monInfoQueue.jsp", out, false);
      out.write("\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<button type=\"submit\" name=\"action\">Atualizar</button>\n");
      out.write("\t</form>\n");
      out.write("</div>\n");


if(refresh){

      out.write("\n");
      out.write("\t<script> \n");
      out.write("\tvar auto_refresh = setInterval(\n");
      out.write("\tfunction()\n");
      out.write("\t{\n");
      out.write("\t$('#atualizar').submit();\n");
      out.write("\t}, 5000);\n");
      out.write("\t</script>\n");
 
}

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
