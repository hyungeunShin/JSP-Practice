<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dtext {
	border: 1px solid black;
	width: 30%;
	height: 100px;
}

#history {
	border: 1px solid black;
	height: 100px;
}
</style>
</head>
<body>
	<div class="dtext" id="firstDiv">첫번째 박스</div>
	<div class="dtext" id="secondDiv">두번째 박스</div>
	<div class="dtext" id="thirdDiv">세번째 박스</div>
	<div class="dtext" id="fourDiv">네번째 박스</div>
	
	<br/>
	<hr/>
	<br/>
	
	<div style="overflow-y: scroll;" id="history"></div>
	
	<select id="boxSelect">
		<option value="1">첫번째 박스</option>
		<option value="2">두번째 박스</option>
		<option value="3">세번째 박스</option>
		<option value="4">네번째 박스</option>
		<option value="5">모든 박스</option>
	</select>
	<input type="text" id="content"/>
	<input type="button" value="출력" id="pBtn"/>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		let textBox = "";  
		let elementBox;	   
		let flag = false;  
		let txt = "";
		his = document.getElementById('history');
		
		$('.dtext').on('click', function() {
			if(flag) { //두번째 클릭
				flag = false;
				elementBox.text($(this).text());
				$(this).text(textBox);
				
				textBox = "";
				elementBox = null;
				$(".dtext").css("background", "white");
			} else {
				flag = true;
				textBox = $(this).text();
				elementBox = $(this);
				$(this).css("background", "yellow");
			}
			
			txt += $(this).attr('id') + "가 클릭되었습니다.<br>";
			
			his.innerHTML = txt;
			his.scrollTop = his.scrollHeight;
		})
	})
	
	$('#pBtn').on('click', function() {
		input = $('#content').val();
		sel = $('#boxSelect').val();
		
		if(sel == "1") {
			$('#firstDiv').text(input);
		}
		if(sel == "2") {
			$('#secondDiv').text(input);
		}
		if(sel == "3") {
			$('#thirdDiv').text(input);
		}
		if(sel == "4") {
			$('#fourDiv').text(input);
		}
		if(sel == "5") {
			$('#firstDiv').text(input);
			$('#secondDiv').text(input);
			$('#thirdDiv').text(input);
			$('#fourDiv').text(input);
		}
		
		$('#content').val("");
	})
	</script>
</body>
</html>