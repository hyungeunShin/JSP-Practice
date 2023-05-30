<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                                    	JSTL이 제공하는 태그의 종류와 사용법
                                    </h6>
                                </div>
                                
                                <div class="card-body">
                                	<!--
                                		406호 전원의 이름을 ','로 구분하여 각각 나눈 후
                                		
                                		-------------------------
                                		'김'씨 성을 가진 사람 몇 명 : 3
                                		'박'씨 성을 가진 사람 몇 명 : 4
                                		...
                                		-------------------------
                                		[출력 예시]
                                		
                                		** 406호 전원의 이름을 넣을 때 스클립틀릿을 활용해도 무방 또는 JSTL로 바로 값을 넣어도 무방
                                		1. JSTL을 이용하여 작성   
                                	 -->
                                	<%
                                		String students = "홍길동,박길동,김길동,김씨,이씨,이순신,이씨야,김씨야";
                                	 	Map<String, Integer> map = new HashMap<>();
                                	%>
                                	
                                	<c:set value="<%= students %>" var="students"></c:set>
                                	<c:set value="${fn:split(students, ',')}" var="arr"></c:set>
                                	 
                                	<!-- map 버전 -->
                                	<c:set value="<%= map %>" var="map"></c:set>
                                	 
                                	<c:forEach items="${arr}" var="stu">
                                		<c:set value="${fn:substring(stu, 0, 1)}" var="firstname"></c:set>
                                	 	<c:set target="${map}" property="${firstname}" value="${map[firstname] + 1}"></c:set>
                                	</c:forEach>
                                	
                                	<c:forEach items="${map}" var="i">
                                		${i.key} = ${i.value}  
                                	</c:forEach> 
                                	<!-- map 버전 -->
                                	 
                                	 
									<!-- arr 버전 -->
                                	<%-- <c:set value="<%= students %>" var="students"></c:set>
                                	<c:set value="${fn:split(students, ',')}" var="arr"></c:set>
                                	 
                        	 		<c:set value="0" var="cnt1"></c:set>
                        	 		<c:set value="0" var="cnt2"></c:set>
                        	 		<c:set value="0" var="cnt3"></c:set>
                        	 		<c:set value="0" var="cnt4"></c:set>
                        	 		<c:set value="0" var="cnt5"></c:set>
                        	 		 
                                	<c:forEach begin="0" end="${fn:length(arr) - 1}" var="i">
                                	 	<c:choose>
                                	 		<c:when test="${fn:startsWith(arr[i], '김')}">
                                	 			<c:set value="${cnt1+1}" var="cnt1"></c:set>
                                	 		</c:when>
                                	 		<c:when test="${fn:startsWith(arr[i], '이')}">
                                	 			<c:set value="${cnt2+1}" var="cnt2"></c:set>
                                	 		</c:when>
                                	 		<c:when test="${fn:startsWith(arr[i], '박')}">
                                	 			<c:set value="${cnt3+1}" var="cnt3"></c:set>
                                	 		</c:when>
                                	 		<c:when test="${fn:startsWith(arr[i], '홍')}">
                                	 			<c:set value="${cnt4+1}" var="cnt4"></c:set>
                                	 		</c:when>
                                	 		<c:otherwise>
                                	 			<c:set value="${cnt5+1}" var="cnt5"></c:set>
                                	 		</c:otherwise>
                                	 	</c:choose>
                                	 	김 : ${cnt1}<br>
                                	 	이 : ${cnt2}<br>
                                	 	박 : ${cnt3}<br>
                                	 	홍 : ${cnt4}<br>
                                	 	그 외 : ${cnt5}<br><hr>
                                	</c:forEach>
                                	<h3>
                                	 	김 : ${cnt1}명<br>
                                	 	이 : ${cnt2}명<br>
                                	 	박 : ${cnt3}명<br>
                                	 	홍 : ${cnt4}명<br>
                                	 	그 외 : ${cnt5}명<br>
                                	</h3> --%>
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
</body>
</html>