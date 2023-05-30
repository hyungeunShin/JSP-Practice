<%@page import="ch11.test.BoardRepository"%>
<%@page import="ch11.test.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	1. 게시글 상세보기를 출력해주세요.
		> JSTL을 활용해주세요. 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	[ 수정  ] [ 삭제  ] [ 목록  ]
	
	2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
	3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
	4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
 -->
	<%
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardRepository rb = BoardRepository.getInstance();
		BoardVO vo = rb.getBoardById(no);
		
		vo.setHit(vo.getHit()+1);
		System.out.println(vo);
	%>
	<c:set value="<%= vo.getNo() %>" var="no"></c:set>
	<c:set value="<%= vo.getTitle() %>" var="title"></c:set>
	<c:set value="<%= vo.getWriter() %>" var="writer"></c:set>
	<c:set value="<%= vo.getRegDate() %>" var="date"></c:set>
	<c:set value="<%= vo.getHit() %>" var="hit"></c:set>
	<c:set value="<%= vo.getContent() %>" var="content"></c:set>
	
	
	<h3>게시판 상세보기</h3>
	
	<br/><hr/><br/>
	
	<p>제목 : <c:out value=""></c:out> </p>	
	<p>${writer}${date}${hit}</p>
	
	<br/><hr/><br/>
	
	<p>내용 : ${content}</p>
	
	<a href="boardUpdateForm.jsp?no=${no}"><button>수정</button></a>	
	<button id="deletebtn" onclick="check()">삭제</button>
	<a href="boardList.jsp"><button>목록</button></a>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript">
	function check() {
		no = "<%= vo.getNo() %>";
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.href = "boardRemove.jsp?no=" + no;
		} else {
			return false;
		}
	}
	</script>	
</body>
</html>
