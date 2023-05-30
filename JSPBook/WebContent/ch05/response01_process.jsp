<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//폼 페이지에서 입력한 한글을 처리하도록 request 내장 객체의 setCharacterEncoding 메소드에
	//문자 인코딩 유형을 UTF-8 로 설정
	request.setCharacterEncoding("utf-8");
	
	//입력한 아이디, 비밀번호를 폼 태그로부터 전송받도록 request 내장 객체의 getParameter() 메소드를 작성
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//폼 태그로부터 전송받은 아이디와 비밀번호가 일치하면 페이지 이동
	if("admin".equals(id) && "1234".equals(pw)) {
		response.sendRedirect("response01_success.jsp");
	} else {
		response.sendRedirect("response01_fail.jsp");
	}
%>
