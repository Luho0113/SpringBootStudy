<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str = "1";
out.println(str);
%>
<%=str%> <!-- 표현식 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
안녕하세요

<%
out.println("<h3>" + "구구단 만들기" + "</h3>");
%>
	<table border="1">
		<tr>
			<%
			for (int i = 2; i < 10; i++) {
			%>
			<th><%=i%>단</th>
			<%
			}
			%>
		</tr>
		<%
		for (int i = 1; i < 10; i++) {
			out.println("<tr>");
			for (int j = 2; j < 10; j++) {

				out.println("<td>" + j + "X" + i + "=" + i * j + "</td>");
			}
			out.println("</tr>");
		}
		%>
	</table>
<%
out.println("<h3>" + "게시판" + "</h3>");
%>



</body>
</html>