<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error Page</title>
</head>
<body>
<div class="container">
	<h1>Something Input Is Wrong!</h1>
	<h2>3秒后跳转</h2>
</div>
	<%
	response.setHeader("Refresh","3;url=login.jsp"); 
	%>
</body>
</html>