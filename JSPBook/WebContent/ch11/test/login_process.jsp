<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	1. 로그인 화면에서 넘겨받은 아이디/비밀번호를 이용하여 로그인 인증을 진행해주세요.
	> 본인이 결정한 아이디/비밀번호일때 로그인 처리해주세요.
	
	2. 로그인 인증
	> 로그인 성공 시, menu.jsp로 이동합니다.
	> 로그인 실패 시, login.jsp로 이동합니다.
 -->
 <%
 	request.setCharacterEncoding("utf-8");
 
 	String id = request.getParameter("id");
 	String pw = request.getParameter("pw");
 	
 	if("aa".equals(id) && "aa".equals(pw)) {
 		response.sendRedirect("menu.jsp");
 	} else {
 		request.getRequestDispatcher("login.jsp?err=1").forward(request, response);
 	}
 %>
