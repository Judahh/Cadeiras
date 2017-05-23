package org.apache.jsp.sip;

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

public final class sipRamalCrud_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	//Params
String requestId = request.getParameter("id");
if(requestId == null || requestId.isEmpty()){
	requestId = "";
}

SIPRamal ramal = SIPRamalFacade.getSipRamal(requestId);

String id = "";
String callerid = "";
String type = "";
String username = "";
String secret = "";
String canreinvite = "";
String host = "";
String context = "";
String dtmfmode = "";
String call_limit = "";
String nat = "";
if(ramal != null){
	id = ramal.getId();
	callerid = ramal.getCallerid();
	type = ramal.getType();
	username = ramal.getUsername();
	secret = ramal.getSecret();
	canreinvite = ramal.getCanreinvite();
	host = ramal.getHost();
	context = ramal.getContext();
	dtmfmode = ramal.getDtmfmode();
	call_limit = ramal.getCall_limit();
	nat = ramal.getNat();
}

      out.write("\n");
      out.write("<div id=\"crud\" class=\"grid col-three-quarters mq2-col-full\">\n");
      out.write("\t<h1>[");
      out.print(id);
      out.write("]</h1>\n");
      out.write("\t<form method=\"post\" id=\"sipRamal\">\n");
      out.write("\t\t<input type=\"hidden\" name=\"id\" value=\"");
      out.print(id);
      out.write("\">\n");
      out.write("\t\t<ul>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>id:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"newId\" value=\"");
      out.print(id);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>callerid:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"callerid\" value=\"");
      out.print(callerid);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>type:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"type\" value=\"");
      out.print(type);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>username:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"username\" value=\"");
      out.print(username);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>secret:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"secret\" value=\"");
      out.print(secret);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>canreinvite:</h4> \n");
      out.write("\t\t\t\t<input type=\"checkbox\" name=\"canreinvite\" ");
if("yes".equals(canreinvite)){
      out.write("checked=\"checked\"");
}
      out.write(">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>host:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"host\" value=\"");
      out.print(host);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>context:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"context\" value=\"");
      out.print(context);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>dtmfmode:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"dtmfmode\" value=\"");
      out.print(dtmfmode);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>call_limit:</h4> \n");
      out.write("\t\t\t\t<input type=\"text\" name=\"call_limit\" value=\"");
      out.print(call_limit);
      out.write("\">\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<h4>nat:</h4>\n");
      out.write("\t\t\t\t<input type=\"checkbox\" name=\"nat\" ");
if("yes".equals(nat)){
      out.write("checked=\"checked\"");
}
      out.write(">\t\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li>\n");
      out.write("\t\t\t\t<button type=\"submit\" name=\"action\" value=\"sipRamalSalvar\" class=\"button fright\">Salvar</button>\n");
      out.write("\t\t\t\t<button type=\"submit\" name=\"action\" value=\"sipRamalDeletar\" class=\"button fright\">Deletar</button>\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t</ul>\n");
      out.write("\t</form>\n");
      out.write("</div>");
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
