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
                                    	유효성 검사
                                    </h6>
                                </div>
                                
                                <div class="card-body">
                                	<!--
                                		아래 정규식을 풀어보고 통과했다면 ch08_test_process.jsp로 전송하여 결과 출력 
                                	 -->
                                	 <form action="ch08_test_process.jsp" method="post" id="frm">
                                	 	<h4>숫자만 입력하되, 7-12 자리까지만 입력</h4>
                                	 	<input type="text" id="quest1" name="quest1" /><br/>
                                	 	
                                	 	<h4>시작은 영소문자 a,b,c고 영소대문자 8-12자리까지만 입력</h4>
                                	 	<input type="text" id="quest2" name="quest2" /><br/>
                                	 	
                                	 	<h4>아이디는 영소문자로 시작하고 영소문자, 숫자 8-16자리까지만</h4>
                                	 	<input type="text" id="id" name="id" /><br/>
                                	 	
                                	 	<h4>비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8-16자리</h4>
                                	 	<input type="text" id="pw" name="pw" /><br/>
                                	 	
                                	 	<h4>이름은 한글 2-5글자</h4>
                                	 	<input type="text" id="name" name="name" /><br/>
                                	 	
                                	 	<h4>
                                	 		휴대폰 번호의 첫번째 자리는 011,016,017,019,070,010으로 시작<br/>
                                	 		두번째 자리는 숫자 3자리 또는 숫자 4자리<br/>
                                	 		세번째 자리는 숫자 4자리 설정
                                	 	</h4>
                                	 	<input type="text" id="phone" name="phone" /><br/>
                                	 	
                                	 	<input type="button" id="sendbtn" value="전송" onclick="Check()" />
                                	 	
                                	 	<!--
                                	 		정규식 테스트
                                	 		https://regexr.com/ 
                                	 	 -->
                                	 </form>
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

    <!-- <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
    
    <script type="text/javascript">
    function Check() {
    	var regquest1 = /^[0-9]{7,12}$/;
    	
    	var regquest2 = /^(abc)[a-zA-Z]{4,9}$/;
    	
    	var regid = /^[a-z][a-z0-9]{7,15}$/;
    	
    	var regpw = /^[A-Z][^가-힣]{7,15}$/; 
    		
    	var regname = /^[가-힣]{2,5}$/;
    	
    	var regphone = /^(010|016|017|019|070)-[\d]{3,4}-[\d]{4}$/;
    	
    	var form = $('#frm');
    	var quest1 = $('#quest1').val();
    	var quest2 = $('#quest2').val();
    	var id = $('#id').val();
    	var pw = $('#pw').val();
    	var name = $('#name').val();
    	var phone = $('#phone').val();
    	
    	if(!regquest1.test(quest1)) {
    		alert("quest1 형식에 맞춰 입력");
    		return false;
    	}
    	
    	if(!regquest2.test(quest2)) {
    		alert("quest2 형식에 맞춰 입력");
    		return false;
    	}
    	
    	if(!regid.test(id)) {
    		alert("아이디는 영문 대문자와 소문자, 한글, 한글의 자음과 모음으로 시작");
    		form.id.select();
    		return false;
    	}
    	
    	if(!regpw.test(pw)) {
    		alert("비밀번호는 숫자만 입력");
    		form.pw.select();
    		return false;
    	}
    	
    	if(!regname.test(name)) {
    		alert("이름은 한글만 입력");
    		form.name.select();
    		return false;
    	}
    	
    	if(!regphone.test(phone)) {
    		alert("연락처 형식에 맞춰 입력");
    		return false;
    	}
    	
    	form.submit();
    }
    </script>
</body>
</html>