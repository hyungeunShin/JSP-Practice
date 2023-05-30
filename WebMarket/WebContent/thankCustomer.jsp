<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
	<%
		String shopping_cartId = "";
		String shopping_shoppingDate = "";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				String name = cookie.getName();
				
				if(name.equals("Shopping_cartId")) {
					shopping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
				}
				if(name.equals("Shopping_shoppingDate")) {
					shopping_shoppingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
				}
			}
		}
	%>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은	<%= shopping_shoppingDate %>에 배송될 예정입니다!!	
		<p>주문번호 : <%= shopping_cartId %>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
	</div>
	<%
		session.invalidate();
		
		for(int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	%>
</body>
</html>