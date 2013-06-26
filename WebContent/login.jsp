<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<h1>Welcome To OSS Toolkit v1.0!</h1>
	<form action="<%=request.getContextPath()%>/index.jsp" method="post"> 
		<table>
			<tr>
				<td>KeyId:</td><td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>KeySecret:</td><td><input type="password" name="secret"/></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="OK" name="submit"/>
				</td>
				<td>
					<input type="reset" value="Reset"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>