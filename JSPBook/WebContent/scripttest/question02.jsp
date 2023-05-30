<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
	width: 100px;
	height: 50px;
}
</style>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td></td>
			<td>전지혜</td>
			<td>신현근</td>
			<td>이지영</td>
			<td colspan="2"></td>
			<td>김지완</td>
			<td>신국현</td>
			<td>이성일</td>
			<td></td>
		</tr>
		<tr>
			<td>고영우</td>
			<td>정재균</td>
			<td>황지현</td>
			<td>박윤수</td>
			<td colspan="2"></td>
			<td>변정민</td>
			<td>정은지</td>
			<td>박정수</td>
			<td>조성희</td>
		</tr>
		<tr>
			<td>김민정</td>
			<td>박승우</td>
			<td>김동혁</td>
			<td>이수진</td>
			<td colspan="2"></td>
			<td>홍기태</td>
			<td>김민욱</td>
			<td>진현성</td>
			<td>오미나</td>
		</tr>
		<tr>
			<td></td>
			<td>구기현</td>
			<td>오대환</td>
			<td>전다미</td>
			<td colspan="2"></td>
			<td>배문기</td>
			<td>유이현</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	<br><hr/><br>
	
	<button id="btn">현재 자리 출력하기</button>
	<p id="output">출력란</p>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		let textBox = "";  //텍스트 저장
		let elementBox;	   //element저장공간
		let flag = false;  //스위치
		
		$('td').on('click', function() {
			if(flag) { //두번째 클릭
				flag = false;
				elementBox.text($(this).text());
				$(this).text(textBox);
				
				textBox = "";
				elementBox = null;
				$("td").css("background", "white");
			} else {
				flag = true;
				textBox = $(this).text();
				elementBox = $(this);
				$(this).css("background", "yellow");
			}
		})
	})
	
	$('#btn').on('click', function() {
		$('#output').text("");
		
		let tds = document.getElementsByTagName("td");
		let html = "<table border='1'><tr>";
		
		for(let i = 1; i <= tds.length; i++) {
			html += "<td width='10%'>" + tds[i-1].innerText + "</td>";
			
			if(i % 9 == 0) {
				html += "</tr><tr>";
			}
		}
		
		html += "</tr></table>";
		$('#output').html(html);
	})
	</script>
</body>
</html>