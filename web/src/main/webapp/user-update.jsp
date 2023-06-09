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
<title>User Update</title>
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
	<h3>회원정보 수정</h3>
	<form method="POST" action="/user-update-ok.jsp">
		<input type="hidden" name="uiNum" value="<%=rs.getInt("UI_NUM")%>"> <br>
		이름 : <input type="text" name="uiName" value="<%=rs.getString("UI_NAME") %>"> <br>
		아이디 : <input type="text" name="uiId" value="<%=rs.getString("UI_ID") %>"> <br>
		비밀번호 : <input type="text" name="uiPwd" value="<%=rs.getString("UI_PWD")%>"> <br>
		<button>수정하기</button>
	</form>
	
	
<% } %>

</body>
</html>