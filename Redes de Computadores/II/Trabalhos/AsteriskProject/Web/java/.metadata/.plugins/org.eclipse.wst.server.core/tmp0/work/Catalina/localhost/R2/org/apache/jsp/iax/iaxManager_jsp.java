package org.apache.jsp.iax;

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

public final class iaxManager_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	//Action
String action = request.getParameter("action");
if(action != null && !action.isEmpty()){
	if ("iaxRamalDeletar".equals(action)) {
		IAXRamalFacade.deleteIaxRamal(request.getParameter("id"));
	} else if ("iaxRamalSalvar".equals(action)) {
		String id = request.getParameter("id");
		String newId = request.getParameter("newId");
		String callerid = request.getParameter("callerid");
		String type = request.getParameter("type");
		String defaultuser = request.getParameter("defaultuser");
		String secret = request.getParameter("secret");
		String context = request.getParameter("context");
		String host = request.getParameter("host");
		String auth = request.getParameter("auth");
		String transfer = "";
		if(request.getParameter("transfer") == null){
			transfer = "no";
		}else{
			transfer = "yes";
		}
		String requiredcalltoken = "";
		if(request.getParameter("requiredcalltoken") == null){
			requiredcalltoken = "no";
		}else{
			requiredcalltoken = "yes";
		}
		IAXRamalFacade.updateIaxRamal(id, new IAXRamal(newId, callerid, type, defaultuser, secret, context, host, auth, transfer, requiredcalltoken));
	}
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
