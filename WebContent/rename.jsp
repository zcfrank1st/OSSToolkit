<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
		<%
			String str = request.getParameter("bn");
			String objs = request.getParameter("objects");
		%>
		<%=str %>-Bucket
</title>
</head>
<body>
	<h1>Rename Bucket:<%=str %>'s Objects</h1>
	<form action="renameAction.jsp?bn=<%=str %>&objs=<%=objs %>" method="post">
		<table border="1">
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
		<input type="submit" name="names" value="Rename">
		<input type="reset" name="reset" value="Cancel">
		<br>
		<a href=# onclick="javascript:history.go(-1);">返回</a>
	</form>
</body>
</html>