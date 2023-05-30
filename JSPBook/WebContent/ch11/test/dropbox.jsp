<%@page import="java.util.ArrayList"%>
<%@page import="ch11.test.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	text-align: center;
}
</style>
</head>
<body>
<!-- 
	첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.
	- 자료실을 구성하는데 필요한 내용 모두는 board를 작성했던 방식을 참고하여 작성한다.
	
	1. 파일의 유형에 따라 유형에 맞는 default 이미지로 리스트를 구성하세요.
	
	[출력 예]
	
	자료실
	[pdf]	[excel]	[excel]	[ppt]
	[image] [txt]	[word]	[txt]
	[etc]	[etc]	[pdf]	[ppt]
	[...]
	
	목록 
 -->
	<%
		BoardRepository rb = BoardRepository.getInstance();
		List<BoardVO> list = rb.selectBoardList();
		
		
		/* List<String> list = null;
		//확장자
		if(boardList != null || boardList.size() != 0) {
			list = new ArrayList<>();
			for(BoardVO vo : boardList) {
				String ext = rb.getFileExt(vo.getFileName());
				list.add(ext);
			}
		} */ 
		
	%>
	<table border="1">
		<thead>
			<tr>
				<th colspan="4">자료실</th>
			</tr>
		</thead>
		<tbody>
			<c:set value="<%= list %>" var="list"></c:set>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<th colspan="4">조회하실 자료가 존재하지 않습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="board">
						<tr>
							<%-- <td><a href="fileDownload.jsp?filename=${board.fileName}">${board.fileName}</a></td> --%>
							<c:choose>
								<c:when test="${board.ext == 'pdf'}">
									<td><img src="./pdf.png" style="width: 30px; height: 30px;">${board.fileName}</td>
								</c:when>
								<c:when test="${board.ext == 'jpg'}">
									<td><img src="./jpg.png" style="width: 30px; height: 30px;">${board.fileName}</td>
								</c:when>
								<c:when test="${board.ext == 'png'}">
									<td><img src="./png.png" style="width: 30px; height: 30px;">${board.fileName}</td>
								</c:when>
								<c:otherwise>
									<td>${board.fileName}</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br><br>
	<a href="menu.jsp"><button>메뉴</button></a>
</body>
</html>