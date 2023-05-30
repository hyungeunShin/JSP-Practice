<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
label {
	display: inline-block;
	width: 100px;
}
</style>
</head>
<body>
	<!-- 
		1. 로그인 페이지를 작성해주세요.
		** 아래 처럼 만들어주세요.
		아이디 : _________
		비밀번호 : __________
		[  로그인   ]
		
		2. 로그인 처리는 login_process.jsp 로 요청해주세요.
		> 회원가입을 진행하지 않고, 특정 아이디/비밀번호를 정해서 로그인 처리해주세요.
	 -->
	 
	 <form action="login_process.jsp" method="post">
	 	<label>아이디 : </label><input type="text" name="id"><br/>
	 	<label>비밀번호 : </label><input type="text" name="pw"><br/>
	 	<input type="submit" value="로그인">
	 </form>
	 
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	 <script type="text/javascript">
	 <%
	 	String err = request.getParameter("err");
	 %>
	 </script>
</body>
</html>