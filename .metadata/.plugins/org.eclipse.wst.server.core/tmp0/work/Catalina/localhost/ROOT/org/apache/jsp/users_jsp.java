/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.73
 * Generated at: 2023-05-04 05:22:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class users_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.Statement");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
    _jspx_imports_classes.add("java.sql.DriverManager");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>User</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

	Connection con;

	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost/nothing"; //DB 가져오는거

	String id = "root";
	String pwd = "1234";
	con = DriverManager.getConnection(url, id, pwd);

	//ui_name 검색하기
	String searchUiName = request.getParameter("uiName");
	String searchUiId = request.getParameter("uiId");

	String sql = "SELECT UI_NUM, UI_NAME, UI_ID, UI_PWD, UI_DATE FROM USER_INFO";

	if (searchUiName != null) {
		//sql 쿼리문 변경, null이 아니면 = 사용자가 검색하면 수행한다
		sql += " WHERE UI_NAME LIKE CONCAT('%',?,'%')";
		if (searchUiId != null) {
			sql += " AND UI_ID LIKE CONCAT('%',?,'%') ";
		}
	} else if (searchUiId != null) {
		sql += " WHERE UI_ID LIKE CONCAT('%',?,'%') ";
	}

	/*
	 sql문 바로 뒤에 붙으니까 띄어쓰기 해주기
	 " WHERE UI_NAME LIKE '%" + searchUiName + "%'"
	 ?에 대입할 값을 연결시켜주는 작업 = 바인딩
	*/

	PreparedStatement stmt = con.prepareStatement(sql);
	/*
	 PreparedStatement는 쿼리문을 문자열로 바꿔서 수행함
	 쿼리문을 미리 기억해뒀다가 실행할 땐 쿼리문을 넣지 않음 -> 데이터에 영향을 덜 주기 위함
	 만약 사용자가 <검색어';DELETE FROM USER_INFO;> 를 검색하면 데이터가 삭제됨 
	 -> Statement를  사용하지 않는 이유
	*/

	if (searchUiName != null) {
		//sql 쿼리문 변경, null이 아니면 = 사용자가 검색하면 수행한다
		stmt.setString(1, searchUiName);
		if (searchUiId != null) {
			stmt.setString(2, searchUiId);
		}
	} else if (searchUiId != null) {
		stmt.setString(1, searchUiId);
	}

	ResultSet rs = stmt.executeQuery();
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("	");

	out.println("<h3>" + "USER_INFO 테이블" + "</h3>");
	out.println("검색한 이름 : " + searchUiName + "<br>");
	out.println("검색한 아이디 : " + searchUiId);
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<form>\r\n");
      out.write("		<input type=\"text\" name=\"uiName\" placeholder=\"검색할 이름을 작성해주세요\">\r\n");
      out.write("		<input type=\"text\" name=\"uiId\" placeholder=\"검색할 아이디를 작성해주세요\">\r\n");
      out.write("		<button>검색</button>\r\n");
      out.write("	</form>\r\n");
      out.write("\r\n");
      out.write("	<table border=\"1\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<th>번호</th>\r\n");
      out.write("			<th>이름</th>\r\n");
      out.write("			<th>아이디</th>\r\n");
      out.write("			<th>작성일자</th>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

		while (rs.next()) {
			
			int uiNum = rs.getInt("UI_NUM");
			String uiName = rs.getString("UI_NAME");
			String uiId = rs.getString("UI_ID");
			String uiDate = rs.getString("UI_DATE");

			out.println("<tr onclick=\"location.href='/user-view.jsp?uiNum=" + uiNum + "'\">");
			out.println("<td>" + uiNum + "</td>");
			out.println("<td>" + uiName + "</td>");
			out.println("<td>" + uiId + "</td>");
			out.println("<td>" + uiDate + "</td>");
			out.println("<tr>");
		}
		
      out.write("\r\n");
      out.write("	</table>\r\n");
      out.write("	<button type=\"button\" onclick=\"location.href='/user-insert.jsp'\">회원등록</button>\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("</script>\r\n");
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
