<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.aliyun.openservices.oss.model.ObjectMetadata"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<h1>Http Header Attr</h1>
	<h2>Bucket:Object--><%=bucket %>:<%=obj %> </h2>
	Content-Type:<%=ContentType %><br><br>
	Content-Length:<%=ContentLength %><br><br>
	<!--  Expires:<%--=Expires --%><br><br>-->
	Cache-Control:<%=CacheControl %><br><br>
	Content-Encoding:<%=ContentEncoding %><br><br>
	Content-Disposition:<%=ContentDisposition %><br><br>
	
	<a href="index.jsp">返回</a>
</body>
</html>