<%@page import="com.oss.operations.DeleteThread"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<title>Deleting</title>
</head>
<body>
	<%
			OSSClient client = (OSSClient)request.getSession().getAttribute("OSSClient"); 
			String bucketName = request.getParameter("bn");
			String objs = request.getParameter("objects");
			String[] nameArray = objs.split(",");
			int totalNum = nameArray.length;
			String[] newNameArr = new String[totalNum];
			
			for(int i=0; i<=totalNum-1; i++){
				String s = nameArray[i].replaceAll("\\?", ",");
				s = s.replaceAll("\\|", "&");
				s = s.replaceAll("\\>", "#");
				s = s.replaceAll("\\<", "%");
				Thread worker = new Thread(new DeleteThread(client,bucketName,s)); 
				worker.start();
			}
	%>
	<h3>删除请求已提交OSS，<a href="index.jsp" class="btn btn-info btn-mini"><i class="icon-leaf icon-white"></i> 返回</a>查看删除结果</h3>
</body>
</html>