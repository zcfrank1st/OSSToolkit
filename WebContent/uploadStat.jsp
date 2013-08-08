<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@page import="com.oss.operations.Container"%>
<%@page import="com.oss.operations.Upload"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<title>File Upload</title>
</head>
<body>
<%
	int trigger = 0;

	OSSClient client = (OSSClient)request.getSession().getAttribute("OSSClient"); 
	String bucketName = request.getParameter("bucket");

	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory); 

	
	String files = "";
	String nums = "";
	List<FileItem> items = upload.parseRequest(request);
	int num = items.size()-1;
	System.out.println(num);
		
	for (int i = 0; i < num; i++) {
		File f = new File("."+i);
		String file = items.get(i).getName();
		//System.out.println(file);
		files = files + file + ";";
		nums = nums + i + ";";
		try {
			items.get(i).write(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Container.threadList.add(i, new Thread(new Upload(client, f, bucketName, file)));
		Container.threadList.get(i).start();
	}

	String[] fl = files.split(";");
	String[] nu = nums.split(";");
%>
	<div class="container">
		<div class="page-header" align="center"><h2>File Upload Status And Control</h2></div>

<%
for(int i=0; i<fl.length; i++){
	trigger++;
%>
		<div class="row">
			<div class="span2"></div>
			<div class="span3">
				<%=fl[i] %>
			</div>
			<div class="span2" ></div>
			<div class = "span3" id=<%="stat" + i%>>[已在上传中]</div>
			<div class="span2"></div>
		</div>
<% } %> 
<br><br>
		<div class="row">
			<div class="span8"></div>
			<div class="span2"><a href="index.jsp" class="btn btn-small btn-success"><i class="icon-leaf icon-white"></i> 返回</a></div>
			<div class="span2"></div>
		</div>
	</div>
</body>
</html>		
