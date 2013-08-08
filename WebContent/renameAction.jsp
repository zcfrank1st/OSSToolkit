<%@page import="com.oss.operations.RenameThread"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Renaming</title>
</head>
<body>
	<%
		OSSClient client = (OSSClient)request.getSession().getAttribute("OSSClient"); 
			String bucketName = request.getParameter("bn");
			String objs = request.getParameter("objs");
			String[] nameArray = objs.split(",");
			int totalNum = nameArray.length;
			String[] newNameArr = new String[totalNum];
			
			for(int i=0; i<=totalNum-1; i++){
				newNameArr[i] = request.getParameter(i+"");
				String s = nameArray[i].replaceAll("\\?", ",");
				s = s.replaceAll("\\|", "&");
				s = s.replaceAll("\\>", "#");
				s = s.replaceAll("\\<", "%");
				Thread worker = new Thread(new RenameThread(client,bucketName,s,newNameArr[i])); 
				worker.start();
			} 
	%>
	<h3>修改请求已提交OSS，<a href="index.jsp" class="btn btn-info btn-mini"><i class="icon-leaf icon-white"></i> 返回</a>查看修改结果</h3>
</body>
</html>