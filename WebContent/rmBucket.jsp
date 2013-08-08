<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remove Bucket</title>
</head>
<body>
	<%
		String bucketName = request.getParameter("rm_bucket");
		OSSClient client = (OSSClient)request.getSession().getAttribute("OSSClient");
		
		try{
			client.deleteBucket(bucketName);
		}catch(Exception e){
	%>
			<script type="text/javascript">
				alert("删除失败！请确保有此bucket同时bucket下木有objects后重新尝试~");
				window.location = "index.jsp";
			</script>
	<%		
		}finally{
	%>
			<script type="text/javascript">
				alert("删除成功！");
				window.location = "index.jsp";
			</script>
	<%		
		}
	%>
</body>
</html>