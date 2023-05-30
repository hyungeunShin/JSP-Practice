<%@page import="ch11.test.BoardRepository"%>
<%@page import="java.util.Date"%>
<%@page import="ch11.test.BoardVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.UploadContext"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionBoard_error.jsp" %>
<!-- 
	1. 게시글 등록을 처리해주세요.
		> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 게시글 등록 실패 시, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
<%
	request.setCharacterEncoding("utf-8");	
	
	String path = request.getServletContext().getRealPath("/resources/images");
	
	File f = new File(path);
	
	if(!f.exists()) {
		f.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	List items = upload.parseRequest(request);
	Iterator it = items.iterator();
	
	Map<String, String> map = new HashMap<>();
	
	while(it.hasNext()) {
		FileItem fileItem = (FileItem) it.next();
		
		if(fileItem.isFormField()) {
			String key = fileItem.getFieldName();
			String value = fileItem.getString("utf-8");
			map.put(key, value);
		} else {
			String key = fileItem.getFieldName();
			String value = fileItem.getName();
			
			if(!"".equals(value)) {
				File saveFile = new File(path + "/" + value);
				fileItem.write(saveFile);
				map.put(key, value);
			}
		}
	}
	
	String title = map.get("title");
	String writer = map.get("writer");
	String content = map.get("content");
	String filename = map.get("filename");
	
	String ext = filename.substring(filename.lastIndexOf(".") + 1);
	
	BoardVO vo = new BoardVO();
	BoardRepository rb = BoardRepository.getInstance();
	
	int no = rb.getNo();
	
	vo.setNo(no);
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	vo.setFileName(filename);
	vo.setHit(0);
	vo.setExt(ext);
	vo.setRegDate(rb.getCurrenTime());
	
	rb.addBoard(vo);
	
	response.sendRedirect("boardView.jsp?no=" + no);
%>