package org.apache.jsp.agent;

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

public final class agentLista_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<aside class=\"grid col-one-quarter mq2-col-full\">\n");
      out.write("\t<p>Agents:</p>\n");
      out.write("\t<form method=\"post\">\n");
      out.write("\t\t<input type=\"hidden\" name=\"action\" value=\"ramalCrud\">\n");
      out.write("\t\t<menu>\n");
      out.write("\t\t\t<ul>\n");
      out.write("\t\t\t\t");

				for(Agent agent : AgentFacade.getAgents()){
				
      out.write("\n");
      out.write("\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t<button type=\"submit\" name=\"id\" class=\"button\" value=\"");
      out.print(agent.getId());
      out.write('"');
      out.write('>');
      out.print(agent.getId());
      out.write("</button>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t");

				}
				
      out.write("\n");
      out.write("\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t<button type=\"submit\" name=\"id\" class=\"button\">+</button>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t</ul>\t\n");
      out.write("\t\t</menu>\n");
      out.write("\t</form>\n");
      out.write("</aside>");
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
