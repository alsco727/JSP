/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.26
 * Generated at: 2022-08-23 11:35:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DBPKG.Util;
import java.sql.*;

public final class modify_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("DBPKG.Util");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>modify</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script type=\"text/javascript\" src=\"check.js\"></script>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<section style=\"position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray\">\r\n");
      out.write("<h2 style=\"text-align:center\"><b>교과목 수정</b></h2>\r\n");
      out.write("\r\n");
      out.write("<form method=\"post\" action=\"action.jsp\" name=\"frm\" style=\"display:flex; align-items:center; justify-content:center; text-align:center\">\r\n");
      out.write("<input type=\"hidden\" name=\"mode\" value=\"modify\">\r\n");
      out.write("<table border=\"1\">\r\n");

request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

try{
	Connection conn = Util.getConnection();
	String sql = "select * from course_tbl where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String lecturer = rs.getString(4);
	String week = rs.getString(5);
	String start_hour = rs.getString(6);
	while(start_hour.length()<4){
		start_hour = "0" + start_hour;
	}
	String end_hour = rs.getString(7);
	while(end_hour.length()<4){
		end_hour = "0" + end_hour;
	}

      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td>과목 코드</td>\r\n");
      out.write("\t<td><input type=\"text\" name=\"id\" style=\"width:100%\" value=\"");
      out.print(id );
      out.write("\" readonly></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td>과목명</td>\r\n");
      out.write("\t<td><input type=\"text\" name=\"name\" style=\"width:100%\" value=\"");
      out.print(rs.getString(2) );
      out.write("\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td>학점</td>\r\n");
      out.write("\t<td><input type=\"text\" name=\"credit\" style=\"width:100%\" value=\"");
      out.print(rs.getString(3) );
      out.write("\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td>담당 강사</td>\r\n");
      out.write("\t<td>\r\n");
      out.write("\t<select name=\"lecturer\" style=\"width:100%\">\r\n");
      out.write("\t\t<option value=\"\">담당 강사</option>\r\n");
      out.write("\t\t<option value=\"1\" ");
 if(lecturer.equals("1")) out.println("selected"); 
      out.write(">김교수</option>\r\n");
      out.write("\t\t<option value=\"2\" ");
 if(lecturer.equals("2")) out.println("selected"); 
      out.write(">이교수</option>\r\n");
      out.write("\t\t<option value=\"3\" ");
 if(lecturer.equals("3")) out.println("selected"); 
      out.write(">박교수</option>\r\n");
      out.write("\t\t<option value=\"4\" ");
 if(lecturer.equals("4")) out.println("selected"); 
      out.write(">우교수</option>\r\n");
      out.write("\t\t<option value=\"5\" ");
 if(lecturer.equals("5")) out.println("selected"); 
      out.write(">최교수</option>\r\n");
      out.write("\t\t<option value=\"6\" ");
 if(lecturer.equals("6")) out.println("selected"); 
      out.write(">임교수</option>\r\n");
      out.write("\t</select>\r\n");
      out.write("\t</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td>요일</td>\r\n");
      out.write("\t<td>\r\n");
      out.write("\t<input type=\"radio\" name=\"week\" value=\"1\" ");
 if(week.equals("1")) out.println("checked"); 
      out.write("> 월\r\n");
      out.write("\t<input type=\"radio\" name=\"week\" value=\"2\" ");
 if(week.equals("2")) out.println("checked"); 
      out.write("> 화\r\n");
      out.write("\t<input type=\"radio\" name=\"week\" value=\"3\" ");
 if(week.equals("3")) out.println("checked"); 
      out.write("> 수\r\n");
      out.write("\t<input type=\"radio\" name=\"week\" value=\"4\" ");
 if(week.equals("4")) out.println("checked"); 
      out.write("> 목\r\n");
      out.write("\t<input type=\"radio\" name=\"week\" value=\"5\" ");
 if(week.equals("5")) out.println("checked"); 
      out.write("> 금\r\n");
      out.write("\t</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td>시작시간</td>\r\n");
      out.write("\t<td><input type=\"text\" name=\"start_hour\" style=\"width:100%\" value=\"");
      out.print(start_hour );
      out.write("\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td>종료시간</td>\r\n");
      out.write("\t<td><input type=\"text\" name=\"end_hour\" style=\"width:100%\" value=\"");
      out.print(end_hour );
      out.write("\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td colspan=\"2\">\r\n");
      out.write("\t<input type=\"button\" value=\"수정\" onclick=\"modify()\">\r\n");
      out.write("\t<input type=\"button\" value=\"취소\" onclick=\"res()\">\r\n");
      out.write("\t</td>\r\n");
      out.write("</tr>\r\n");

}
catch(Exception e){
	e.printStackTrace();
}

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("</section>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
