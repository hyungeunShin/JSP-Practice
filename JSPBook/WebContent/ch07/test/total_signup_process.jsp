<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
	1) 회원가입 폼에서 넘겨받은 일반데이터, 파일데이터를 전달받아서 일반데이터와 파일명을 저장하여 회원 객체를 하나 만들고, 회원 목록에 해당하는 리스트에 저장
		- DAO, VO
	
	2) 저장된 회원을 목록페이지에서 리스트 데이터를 활용
	
	3) 회원가입이 완료되면, total_signin.jsp로 이동하여 로그인을 진행 
-->

<%
	request.setCharacterEncoding("utf-8");

	String path = "C://upload";
	
	//String path = request.getServletContext().getRealPath("/resources/images");
	//내가 사용중인 프로젝트의 contextPath 경로(JSPBook/resources/images 경로)
	//이클립스상에서의 폴더 경로가 아닌 이클립스에서 만들어낸 프로젝트가 배포되어 생성되는 배포 경로를 뜻한다.
	// => D:\A_TeachingMaterial\6_JspSpring\00. JSP\workspace_jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPBook\resources\images
	
	
	File tempFile = new File(path);
	
	if(!tempFile.exists()) {
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	MemberVO vo = new MemberVO();
	String fileName = "";
	while(params.hasNext()) {
		FileItem fileItem = (FileItem) params.next();
		
		if(fileItem.isFormField()) { //일반 데이터만 거르기
			String name = fileItem.getFieldName();
			String value = fileItem.getString("UTF-8");
			
			if("id".equals(name)) {
				vo.setMem_id(value);
			}
			if("pw".equals(name)) {
				vo.setMem_pw(value);
			}
			if("name".equals(name)) {
				vo.setMem_name(value);
			}
			if("gender".equals(name)) {
				vo.setMem_sex(value);
			}
		} else { 												
			fileName = fileItem.getName();   		         
			File file = new File(path + "/" + fileName);
			fileItem.write(file);  
			vo.setFilename(fileName);
		}
	} 
	
	
	MemberDAO dao = MemberDAO.getInstance();
	dao.insertMember(vo);
	
	response.sendRedirect("total_signin.jsp");
%>

	
