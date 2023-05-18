<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Delete</title>
</head>
<body>
<%
String uiNum = request.getParameter("uiNum");

Connection con = DBCon.getCon();
String sql = "DELETE FROM USER_INFO WHERE UI_NUM=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, uiNum);
%>

<% 
int result = pstmt.executeUpdate();

if(result == 1){
%>
	<script>
	   alert('회원 정보가 정상적으로 삭제되었습니다.');
	   location.href='/users.jsp';
	</script>
<%
} else{   
%>
	<script>
	   alert('회원 정보가 삭제되지 않았습니다.');
	   location.href='/users.jsp';
	</script>
<%
}
%>
</body>
</html>