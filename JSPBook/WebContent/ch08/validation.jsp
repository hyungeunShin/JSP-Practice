<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
		input type button/submit 은 예전부터 익히 사용되어 왔던 대표적인 버튼 element이다
		브라우저 엔진 버전과 html 버전이 업그레이드 되면서 input type button/submit만이 대체할 수 없는 부분들이 발견되어
		새롭게 만들어진 태그가 button 태그인데, input type button/submit은 end태그로서의 활용이 어려워
		css를 활용하여 또는 태그들을 활용하여 버튼을 꾸미는데 제약이 많이 걸린다. button태그는 몸체를 꾸밀 수 있다는 장점이 있어
		css를 활용하는건 물론 버튼 태그 내에 다양한 태그를 활용하여 버튼을 꾸밀 수 있다.
		그리고 input type button 에서 제공되는 click, submit 또한 제공된다.
		
		우리가 다양하게 사용하고 있는 버튼 이벤트들 중, submit 이라는 이벤트는 기본적으로 form 태그 내에 있는 input 요소들의 데이터를 읽어 action에 설정되어 있는 경로로
		데이터를 보내주는 역할을 하는데, submit() 이벤트 자체만으로 본다면 브라우저마다의 엔진별 특징이 조금씩 다르다.
		그리고 submit()이벤트 자체에 컨트롤이 생각보다 어려운것도 사실이다. 대표적으로는 브라우저의 엔진별 처리 로직과 시점이다.
		사용자가 사용하는 다양한 환경의 needs를 맞춰 개발하기란 쉽지 않지만 누구나 사용가능한 공통적인 처리 로직을 구현하는건 어렵지 않다.
		개발자들 사이에서 관례로 사용되는 내용들이 여기에도 포함된다. (ex. serviceimpl에서 impl은 인터페이스를 implements했다는 증거)
		- input type submit 버튼에는 onclick 요소를 활용하여 클릭 이벤트를 함께 주지 않는다.
		> click과 submit 이벤트의 시점과 브라우저 버전별, 엔진 처리 로직의 차이 때문에
		
		# onsubmit 속성 활용
		- onsubmit이벤트는 모든 브라우저에서 지원이 가능
		- onsubmit="return 함수명"으로 사용
			> return을 부여하는건 해당 함수가 실행 될 때, 정상처리되면 true / 값의 필터에 의해 처리결과가 비정상적일땐 false
			> 이때 submit 이벤트가 발생하지 않는다
			
		# onclick 속성 활용
		- input type button의 onclick 속성의 활용
		 
	 -->
	<form action="process.jsp" name="loginForm" onsubmit="return submitEvent()">
		아이디 : <input type="text" name="id"/><br/>
		비밀번호: <input type="text" name="pw"><br/>
		<input type="submit" value="전송"/>
	</form>
	
	<form action="process.jsp" id="loginForm2">
		아이디 : <input type="text" name="id" id="id"/><br/>
		비밀번호: <input type="text" name="pw" id="pw"><br/>
		<input type="submit" value="전송"/>
	</form>
	
	<form action="process.jsp" id="loginForm3">
		아이디 : <input type="text" name="id" id="id3"/><br/>
		비밀번호: <input type="text" name="pw" id="pw3"><br/>
		<input type="button" value="전송" id="sendbtn"/>
	</form>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript">
	function submitEvent() {
		console.log("submit event")
		
		let id = document.loginForm.id.value;
		let pw = document.loginForm.pw.value;
		
		if(id == "") {
			alert("아이디 누락");
			return false;
		}
		
		if(pw == "") {
			alert("비밀번호 누락");
			return false;
		}
	}
	
	//$(function() {
		let lf2 = $("#loginForm2");
		let lf3 = $("#loginForm3");
		let btn = $("#sendbtn");
		
		lf2.submit(function(event) {
			console.log("event")
			alert("jquery event")
			
			let id = $("#id").val();
			let pw = $("#pw").val();
			
			if(id == "") {
				alert("아이디 누락");
				return false;
			}
			
			if(pw == "") {
				alert("비밀번호 누락");
				return false;
			}
		})
		
		btn.on("click", function() {
			let id = $("#id3").val();			
			let pw = $("#pw3").val();
			
			if(id == "") {
				alert("아이디 누락");
				return false;
			}
			
			if(pw == "") {
				alert("비밀번호 누락");
				return false;
			}
			
			lf3.submit();
		})
	//})
</script>
</body>
</html>