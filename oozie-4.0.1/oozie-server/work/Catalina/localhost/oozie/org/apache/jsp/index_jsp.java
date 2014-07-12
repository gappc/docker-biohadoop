package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.oozie.sla.service.SLAService;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!--\n");
      out.write("  Licensed to the Apache Software Foundation (ASF) under one\n");
      out.write("  or more contributor license agreements.  See the NOTICE file\n");
      out.write("  distributed with this work for additional information\n");
      out.write("  regarding copyright ownership.  The ASF licenses this file\n");
      out.write("  to you under the Apache License, Version 2.0 (the\n");
      out.write("  \"License\"); you may not use this file except in compliance\n");
      out.write("  with the License.  You may obtain a copy of the License at\n");
      out.write("\n");
      out.write("       http://www.apache.org/licenses/LICENSE-2.0\n");
      out.write("\n");
      out.write("  Unless required by applicable law or agreed to in writing, software\n");
      out.write("  distributed under the License is distributed on an \"AS IS\" BASIS,\n");
      out.write("  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n");
      out.write("  See the License for the specific language governing permissions and\n");
      out.write("  limitations under the License.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
      out.write("        <title>Oozie Web Console</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"ext-2.2/resources/css/ext-all.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"ext-2.2/resources/css/xtheme-default.css\"/>\n");
      out.write("\n");
      out.write("        <!-- jquery needs to be before extjs -->\n");
      out.write("        <script type=\"text/javascript\" charset=\"utf8\" src=\"console/sla/js/table/jquery-1.8.3.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"console/sla/css/jquery.dataTables.css\">\n");
      out.write("        <script type=\"text/javascript\" src=\"console/sla/js/table/jquery.dataTables.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"console/sla/js/table/jquery-ui-1.10.3.custom.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"console/sla/js/table/jquery-ui-timepicker-addon.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"console/sla/js/graph/jquery.flot.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"console/sla/js/oozie-sla.js\"></script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"ext-2.2/adapter/ext/ext-base.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"ext-2.2/ext-all.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"ext-2.2/examples/grid/RowExpander.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"json2.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"oozie-console.js\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"dependencies\" style=\"display:none;color:red\">\n");
      out.write("            <p><strong>Oozie web console is disabled.</strong></p>\n");
      out.write("            <p>To enable Oozie web console install the Ext JS library.</p>\n");
      out.write("            <p>Refer to <a href=\"./docs/DG_QuickStart.html\">Oozie Quick Start</a> documentation for details.</p>\n");
      out.write("            <hr />\n");
      out.write("        </div>\n");
      out.write("        <!-- LIBS -->\n");
      out.write("\n");
      out.write("        <div id=\"Header\" style=\"padding:2\">\n");
      out.write("           <img src=\"./oozie_50x.png\" height=\"16\" width=\"70\"/>\n");
      out.write("           <a href=\"./docs/index.html\" target=\"bottom\">Documentation</a>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        ");

            boolean isSLAServiceEnabled = SLAService.isEnabled();
        
      out.write("\n");
      out.write("        <div id=\"oozie-body\" style=\"padding:2\">\n");
      out.write("            <div class=\"x-tab-panel-header x-unselectable x-tab-strip-top\" style=\"width:1048\">\n");
      out.write("               <span style=\"font-family:tahoma,arial,helvetica; font-size:11px;font-weight: bold; color: #15428B;\">\n");
      out.write("                 <script type=\"text/javascript\">\n");
      out.write("                    var msg = \"Oozie Web Console\";\n");
      out.write("                    var isSLAServiceEnabled = \"");
      out.print(isSLAServiceEnabled);
      out.write("\";\n");
      out.write("                    document.title = msg;\n");
      out.write("                    document.write(msg);\n");
      out.write("                 </script>\n");
      out.write("               </span>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"oozie-console\"></div>\n");
      out.write("            <div id=\"info\"> </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
