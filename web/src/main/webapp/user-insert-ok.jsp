<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String uiId = request.getParameter("uiId");
String uiName = request.getParameter("uiName");
String uiPwd = request.getParameter("uiPwd");
%>    
    
입력한 아이디: <%=uiId %><br>
입력한 이름: <%=uiName %><br>
입력한 비밀번호: <%=uiPwd %><br>

<%
Connection con = DBCon.getCon();

String sql = "INSERT INTO USER_INFO(UI_NAME, UI_ID, UI_PWD) VALUES (?, ?, ?)";

PreparedStatement stmt = con.prepareStatement(sql);

stmt.setString(1, uiName);
stmt.setString(2, uiId);
stmt.setString(3, uiPwd);

int result = stmt.executeUpdate();

if(result == 1){
%>
	<script>
	   alert('회원 정보가 정상적으로 등록되었습니다.');
	   location.href='/users.jsp';
	</script>
<%
} else{   
%>
	<script>
	   alert('회원 정보가 등록되지 않았습니다.');
	   location.href='/users.jsp';
	</script>
<%
}
%>


