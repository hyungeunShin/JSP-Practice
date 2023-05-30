<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                            
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	회원목록
                                    </h6>
                                </div>
                                
                                <div class="card-body">
									<!--
										1) 로그인 성공 후, 넘어왔을때 'a001님! 환영합니다!' 메시지 출력
		
										2) 회원 목록에 저장되어 있는 회원 모두 출력
		
										________________________________________
										이미지	ㅣ	회원정보	|	버튼	
										________________________________________
		
										이미지  	ㅣ아이디 : a001		ㅣ
												ㅣ비밀번호 : 1234	ㅣ	[상세정보]
												ㅣ이름 : 000		ㅣ
												ㅣ 성별 : 남자		ㅣ
				
										3) 회원등록 버튼을 클릭 시, 회원 가입 페이지로 이동하여 회원 등록을 진행
	 								-->
	 								<%
	 									MemberDAO dao = MemberDAO.getInstance();
	 									List<MemberVO> list = dao.getMemberList();
	 								%>
	 								<table border="1">
	 									<tr>
	 										<th>이미지</th>
	 										<th>회원정보</th>
	 										<th>상세정보</th>
	 									</tr>
	 									
	 									<%
	 										for(int i = 0; i < list.size(); i++) {
	 											MemberVO vo = list.get(i);	
	 									%>
	 									<tr>
	 										<td>
	 											<img alt="" src="/img/<%= vo.getFilename() %>">
	 										</td>
	 										<td>
	 											아이디    : <%= vo.getMem_id() %><br/>
	 											비밀번호 : <%= vo.getMem_pw() %><br/>
	 											이름       : <%= vo.getMem_name() %><br/>
	 											성별       : <%= vo.getMem_sex() %><br/>
	 										</td>
	 										<td>
	 											<a href="#">[상세정보]</a>
	 										</td>
	 									</tr>
	 									<%
	 										}
	 									%>
	 								</table>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
    <script type="text/javascript">
    <%
    	String id = (String) session.getAttribute("id");
    %>
    myid = '<%= id %>';
    alert(myid + "님! 환영합니다!");
    </script>
</body>
</html>