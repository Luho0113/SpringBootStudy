<%@page import="com.web.common.DBCon"%>
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
<title>일기장</title>
</head>
<body>

<%
Connection con = DBCon.getCon(); //DBCon 클래스에 작성한 DB 커넥션 메소드 호출
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT DI_NUM, DI_SUBJECT, DI_CONTENT, DI_WEATHER, DI_MOOD, DI_MEMO, DI_DATE FROM DIARY");
%>
<%
out.println("<h3>" +"Diary 테이블" + "</h3>");
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>날씨</th>
		<th>기분</th>
		<th>메모</th>
		<th>날짜</th>
	</tr>
	<%
	while(rs.next()){
		int diNum = rs.getInt("DI_NUM");
		String diSubject = rs.getString("DI_SUBJECT");
		String diContent = rs.getString("DI_CONTENT");
		String diWeather = rs.getString("DI_WEATHER");
		String diMood = rs.getString("DI_MOOD");
		String diMemo = rs.getString("DI_MEMO");
		String diDate = rs.getString("DI_DATE");
		
		out.println("<tr>");
		out.println("<td>" + diNum + "</td>");
		out.println("<td>" + diSubject + "</td>");
		out.println("<td>" + diContent + "</td>");
		out.println("<td>" + diWeather + "</td>");
		out.println("<td>" + diMood + "</td>");
		out.println("<td>" + diMemo + "</td>");
		out.println("<td>" + diDate + "</td>");
		out.println("</tr>");
	}
	%>
</table>

</body>
</html>