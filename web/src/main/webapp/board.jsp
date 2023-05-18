<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<%
	Connection con; //커넥션 준비
	Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 준비 ex)유심장착

	String url = "jdbc:mysql://localhost/nothing"; //ex) 전화번호
	String id = "root";
	String pwd = "1234";

	con = DriverManager.getConnection(url, id, pwd);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT BI_NUM, BI_TITLE, BI_CONTENT, BI_WRITER, BI_CNT, BI_DATE FROM BOARD_INFO");
	%>
	<%
	out.println("<h3>" + "BOARD_INFO 테이블" + "</h3>");
	%>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<%
		while (rs.next()) {
			int biNum = rs.getInt("BI_NUM");
			String biTitle = rs.getString("BI_TITLE");
			String biWriter = rs.getString("BI_WRITER");
			int biCnt = rs.getInt("BI_CNT");
			out.println("<tr>");
			out.println("<td>" + biNum + "</td>");
			out.println("<td>" + biTitle + "</td>");
			out.println("<td>" + biWriter + "</td>");
			out.println("<td>" + biCnt + "</td>");
			out.println("<tr>");
		}
		%>

	</table>
</body>
</html>