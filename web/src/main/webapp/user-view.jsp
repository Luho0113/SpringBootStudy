<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User View</title>
</head>
<body>
<%

String uiNum = request.getParameter("uiNum"); //String 타입으로 uiNum을 전달받음

Connection con = DBCon.getCon();

String sql = "SELECT * FROM USER_INFO WHERE UI_NUM=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, uiNum);

ResultSet rs = pstmt.executeQuery();

if(rs.next()){ %>
	<%out.println("<h3>" + rs.getString("UI_NAME") + "회원의 상세정보</h3>");%>
	
	번호 : <%=rs.getInt("UI_NUM")%> <br>
	이름 : <%=rs.getString("UI_NAME") %> <br>
	아이디 : <%=rs.getString("UI_ID") %> <br>
	비밀번호 : <%=rs.getString("UI_PWD")%> <br>
	등록일 : <%=rs.getString("UI_DATE")%> <br>
	
	<button onclick="location.href='/user-update.jsp?uiNum=<%=rs.getInt("UI_NUM")%>'">정보 수정</button>
	
	<button onclick="location.href='/user-delete.jsp?uiNum=<%=rs.getInt("UI_NUM")%>'">회원 삭제</button>
<% } %>


</body>
</html>