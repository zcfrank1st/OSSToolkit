<%@page import="com.oss.operations.RenameThread"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		Thread worker = new Thread(new RenameThread(client,bucketName,nameArray[i],newNameArr[i]));
		worker.start();
			}
	%>
	<h3>修改请求已提交OSS，<a href="index.jsp">返回</a>查看修改结果</h3>
</body>
</html>