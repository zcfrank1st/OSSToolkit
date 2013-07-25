<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.aliyun.openservices.oss.model.ObjectMetadata"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Http Header Attr</title>
</head>
<body>
	<%
		OSSClient c = (OSSClient)request.getSession().getAttribute("OSSClient"); 
		String bucket = request.getParameter("bucket");
		String obj = request.getParameter("object");
		
		ObjectMetadata meta = c.getObjectMetadata(bucket, obj);
		
		String ContentType = meta.getContentType();
		String ContentLength = meta.getContentLength() + "";
		
		//Date Expires = meta.getExpirationTime();
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String date = df.format(Expires);
		
		String CacheControl = meta.getCacheControl();
		String ContentEncoding = meta.getContentEncoding();
		String ContentDisposition = meta.getContentDisposition();
	%>
<div class="container">
	<div class="page-header"><h1>Http Header Attr  <small>Bucket:Object--><%=bucket %>:<%=obj %></small></h1></div>
	<table class="table table-striped table-bordered">
		<tr>
			<td>Content-Type:<%=ContentType %><br><br></td>
		</tr>
		<tr>
			<td>Content-Length:<%=ContentLength %><br><br></td>
		</tr>
		<tr>
			<td>Cache-Control:<%=CacheControl %><br><br></td>
		</tr>
		<tr>
			<td>Content-Encoding:<%=ContentEncoding %><br><br></td>
		</tr>
		<tr>
			<td>Content-Disposition:<%=ContentDisposition %><br><br></td>
		</tr>
	</table>
	
	<!--  Expires:<%--=Expires --%><br><br>-->
	<a href="index.jsp" class="btn btn-info btn-mini"><i class="icon-leaf icon-white"></i> 返回</a>
</div>
</body>
</html>