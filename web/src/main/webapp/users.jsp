<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
</head>
<body>
	<%
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
	%>

	<%
	out.println("<h3>" + "USER_INFO 테이블" + "</h3>");
	out.println("검색한 이름 : " + searchUiName + "<br>");
	out.println("검색한 아이디 : " + searchUiId);
	%>

	<form>
		<input type="text" name="uiName" placeholder="검색할 이름을 작성해주세요">
		<input type="text" name="uiId" placeholder="검색할 아이디를 작성해주세요">
		<button>검색</button>
	</form>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>작성일자</th>
		</tr>
		<%
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
		%>
	</table>
	<button type="button" onclick="location.href='/user-insert.jsp'">회원등록</button>
</body>
<script>
</script>
</html>