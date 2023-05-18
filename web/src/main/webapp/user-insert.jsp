<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Insert</title>
</head>
<body>
<h3>회원 등록</h3>
<form action="/user-insert-ok.jsp" method="POST">
	<!-- name속성은 key값(서버로 보내는), id속성은 자바스크립트에서 사용하기 위함 -->
	아이디 : <input type="text" name="uiId" placeholder="아이디를 입력해주세요." /> <br>
	비밀번호 : <input type="password" name="uiPwd" placeholder="비밀번호를 입력해주세요." /> <br>
	이름 : <input type="text" name="uiName" placeholder="이름를 입력해주세요." /> <br>
	<button>회원등록</button>
</form>

</body>
</html>