<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>


<%
List<Map<String,String>> list = new ArrayList<>();

for(int i=1;i<=10;i++){
   Map<String,String> board = new HashMap<>();
   board.put("bi_num","" + i);
   board.put("bi_title","게시글" + i);
   board.put("bi_writer","글쓴이" + i);
   list.add(board);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
<%
out.println("<h3>" + "게시판" + "</h3>");
%>
<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>

		<%
		for (Map<String, String> map : list) {
		%>
		<tr>
			<td>
				<%
				out.println(map.get("bi_num"));
				%>
			</td>
			<td>
				<%
				out.println(map.get("bi_title"));
				%>
			</td>
			<td>
				<%
				out.println(map.get("bi_writer"));
				%>
			</td>
		</tr>
		<%} 
		%>

	</table>
	
<!-- for(Map<String, String> map : list){
	out.println("번호: " + map.get("bi_num"));
	out.println("제목: " + map.get("bi_title"));
	out.println("작성자: " + map.get("bi_writer"));
	out.println("<br>");
} -->


</body>
</html>