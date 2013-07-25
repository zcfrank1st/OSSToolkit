<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<title>
		<%
			String str = request.getParameter("bn");
			String objs = request.getParameter("objects");
		%>
		<%=str %>-Bucket
</title>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h1>Rename Bucket:<%=str %>'s Objects</h1>
	</div>
	<form action="renameAction.jsp?bn=<%=str %>&objs=<%=objs %>" method="post">
		<table class="table table-bordered table-striped table-condensed">
			<tr>
				<td>Bucket Name</td>
				<td>Objects' Old Names</td>
				<td>Objects' New Names</td>
			</tr>
			<tr>
				<td><%=str %></td>
				<td>
					<%
						String[] objArr = objs.split(",");
						for(int i=0; i<=objArr.length-1; i++){
					%>
						<%=objArr[i] %><br>
					<% }%>
				</td>
				<td>
					<%
						for(int i=0; i<=objArr.length-1; i++){
					%>
					
						<input type="text" name="<%=i+"" %>"/><br>
					<%
						}
					%>
				</td>
			</tr>
		</table>
		<input type="submit" name="names" value="Rename" class="btn btn-small btn-primary">
		<input type="reset" name="reset" value="Cancel" class="btn btn-small btn-primary">
		<br><br>
		<a href=# onclick="javascript:history.go(-1);return false;" class="btn btn-mini btn-info"><i class="icon-leaf icon-white"></i> 返回</a>
	</form>
</div>
</body>
</html>