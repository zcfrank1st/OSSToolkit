<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
</head>
<body>
<div class="container">
	<div class="page-header">
	<div class="row">
		<div class="span1"></div>
		<div class="span10"><center><h1>Welcome To OSS Toolkit <small>v1.0</small></h1></center></div>
		<div class="span1"></div>
	</div>
	</div>
	<br><br><br><br><br>

	<form action="<%=request.getContextPath()%>/index.jsp" method="post" class="form-horizontal">
		<div class="row">
			<div class="span3"></div>
			<div class="span6">
				<div class="row">
				<div class="span1"></div>
				<div class="span4">
					<div class="input-prepend">
					<span class="add-on"><em>KeyId:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</em></span><input type="text" name="id" placeholder="请输入阿里云Id" class="span3"/></span>
					</div>
				</div>
				<div class="span1"></div>
				</div>
			</div>
			<div class="span3"></div>
		</div>
		<br>

		<div class="row">
			<div class="span3"></div>
			<div class="span6">
				<div class="row">
				<div class="span1"></div>
				<div class="span4">
				<div class="input-prepend">
					<span class="add-on"><em>KeySecret:</em></span><input type="password" name="secret" placeholder="请输入阿里云Secret" class="span3"/>
				</div>
				</div>
				<div class="span1"></div>
				</div>
			</div>
			<div class="span3"></div>
		</div>
		<br>

		<div class="row">
			<div class="span4"></div>
			<div class="span5">
				<input type="submit" value="OK" name="submit" class="btn btn-primary span2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="Reset" class="btn btn-primary span2"/>
			</div>
			<div class="span3"></div>
		</form>

</div>
</body>
</html>