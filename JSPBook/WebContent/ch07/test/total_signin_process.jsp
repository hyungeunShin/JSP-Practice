<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!--
	1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.

	2. 전달받은 아이디, 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
		- DAO, VO 활용

	3. 전달받은 아이디 비밀번호에 해당하는 회원인 경우에 total_memberList.jsp로 이동하여 회원 목록 페이지를 완성
		- 회원 목록 페이지로 넘어가서 해당 목록 페이지에서 'a001'님! 환영합니다!' 메시지 출력

	4. 전달받은 아이디 비밀번호에 해당하지 않는 회원인  경우엔 total_signin.jsp로 이동하여 다시 로그인을 진행 하고 에러 메시지 출력 
-->
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	MemberDAO dao = MemberDAO.getInstance();
	List<MemberVO> list = dao.getMemberList();

	for(MemberVO vo : list) {
		if(id.equals(vo.getMem_id()) && pw.equals(vo.getMem_pw())) {
			session.setAttribute("id", id);
			response.sendRedirect("total_memberList.jsp");
			return;
		} 
	}

	request.getRequestDispatcher("total_signin.jsp?err=1").forward(request, response);
%>
