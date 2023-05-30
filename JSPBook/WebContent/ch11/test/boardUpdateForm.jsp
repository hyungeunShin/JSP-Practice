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
	1. 게시판 수정 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 제목입니다1
	작성자 : 홍길동
	내용 : 내용입니다1
	─────────────────────────────
	[ 수정  ] [ 목록 ]
	
	2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
 -->
 	<%
 		int no = Integer.parseInt(request.getParameter("no"));
 	%>
 	
 	<h4>게시글 수정</h4>
 	<hr><br>
 	
	<form action="boardUpdate.jsp" method="post">
		<input type="hidden" value="<%= no %>" name="no">
		<label>제목 : </label><input type="text" name="title"><br/>
		<label>작성자 : </label><input type="text" name="writer"><br/>
		<label>내용 : </label><input type="text" name="content"><br/>
		<br><hr><br>
		<input type="submit" value="수정">
		<a href="boardList.jsp"><button type="button"></button></a>
	</form>
	
</body>
</html>