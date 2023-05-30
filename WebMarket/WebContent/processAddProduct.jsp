<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	//업로드 디렉토리가 웹 서비스 디렉토리 하위에 전조
	// => D:\A_TeachingMaterial\6_JspSpring\00. JSP\workspace_jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPBook\resources\images
	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String encType = "utf-8";
	
	int maxSize = 5 * 1024 * 1024;
	
	File file = new File(realFolder);
	
	if(!file.exists()) {
		file.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	
	List items = upload.parseRequest(request);
	Iterator param = items.iterator();
	
	String productId = "";
    String name = "";
    String unitPrice = "";
    String description = "";
    String manufacturer = "";
    String category = "";
    String unitsInStock = "";
    String condition = "";
    String fileName = "";
    
    while(param.hasNext()) {
    	FileItem item = (FileItem) param.next();
    	
    	if(item.isFormField()) {
    		String key = item.getFieldName();
    		
    		if(key.equals("productId")) {
    			productId = item.getString(encType);
    		}
    		if(key.equals("name")) {
    			name = item.getString(encType);
    		}
    		if(key.equals("unitPrice")) {
    			unitPrice = item.getString(encType);
    		}
    		if(key.equals("description")) {
    			description = item.getString(encType);
    		}
    		if(key.equals("manufacturer")) {
    			manufacturer = item.getString(encType);
    		}
    		if(key.equals("category")) {
    			category = item.getString(encType);
    		}
    		if(key.equals("unitsInStock")) {
    			unitsInStock = item.getString(encType);
    		}
    		if(key.equals("condition")) {
    			condition = item.getString(encType);
    		}
    	} else {
    		String fileFieldName = item.getFieldName();
    		fileName = item.getName();
    		String contentType = item.getContentType();
    		String originalFileName = fileName;
    		long fileSize = item.getSize();
    		File saveFile = new File(realFolder + "/" + fileName);
    		item.write(saveFile);
    	}
    }

	int price;
	
	if(unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product p = new Product();
	
	p.setProductId(productId);
	p.setPname(name);
	p.setUnitPrice(price);
	p.setDescription(description);
	p.setManufacturer(manufacturer);
	p.setCategory(category);
	p.setUnitsInStock(stock);
	p.setCondition(condition);
	p.setFilename(fileName);
	
	dao.addProduct(p);
	
	response.sendRedirect("products.jsp");
%>