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
		String keyID = request.getParameter("id");
		String keySecret = request.getParameter("secret");
		
		//String keyID = "PTtBteSjexMwejlq";  //测试使用
		//String keySecret = "5TiBs4PYTZDgDlBV1vaoV2rpJe9fZ0";  //测试使用
		OSSClient client = new OSSClient(keyID,keySecret);
		
		
		try{
			client.listBuckets();
		}catch(Exception e){
	%>
		<script type="text/javascript">
			alert("keyID and keySecret are wrong!");
			window.location='login.jsp';
		</script>
	<%  
	    }
	%>
		<script type="text/javascript">
			window.location='index.jsp';
		</script>
	<%
		request.getSession().setAttribute("OSSClient",client);
		//request.getSession().setAttribute("Id",keyID);
		//request.getSession().setAttribute("Secret",keySecret);
		
	%>
</body>
</html>