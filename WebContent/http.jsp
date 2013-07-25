<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<title>
		<%
			String str = request.getParameter("bn"); 
			String objs = request.getParameter("objects"); 
		%>
		<%=str %>-Bucket</title>
</head>
<body>
<div class="container">
<div class="page-header">
<h1>Change Bucket:<%=str %>'s Objects' Http Headers</h1>
</div>
	<form action="httpAction.jsp?bn=<%=str %>&objs=<%=objs %>" method="post">
		<table class="table table-striped table-bordered">
			<tr>
				<td>Bucket Name</td>
				<td>Object Names</td>
				<td>Http Headers</td>
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
						<font color="red"><b>Object-<%=objArr[i] %>:</b></font><br>
						Content-Type:<input type="text" name="<%=i+"ct" %>" value="application/octet-stream"  class="in" style="color:#999;" /><br>
						Content-Length:<input type="text" name="<%=i+"cl" %>" value="1" class="in" style="color:#999;"/><br>
						Expires:<input type="text" name="<%=i+"e" %>" value="1" class="in" style="color:#999;"/><br>
						Cache-Control:<input type="text" name="<%=i+"cc" %>" value="no-cache" class="in" style="color:#999;"/><br>
						Content-Encoding:<input type="text" name="<%=i+"ce" %>" value="deflate" class="in" style="color:#999;"/><br>
						Content-Disposition:<input type="text" name="<%=i+"cd" %>" value="attachment" class="in" style="color:#999;"/>
						<br><br>
						<script type="text/javascript">
							$(".in").focus(function(){  
					        	var txt = $(this).val();  
					        	if (txt == this.defaultValue) {  
					            	$(this).val("");
					            	$(this).css("color","black");
					        	}  
					    	});  
						</script>
					<%
						}
					%>
				</td>
			</tr>
		</table>
		<input type="submit" name="httpheaders" value="Change" class="btn btn-small btn-primary">
		<input type="reset" name="reset" value="Cancel" class="btn btn-small btn-primary">
		<br><br>
		<a href=# onclick="javascript:history.go(-1);return false;" class="btn btn-mini btn-info"><i class="icon-white icon-leaf"></i> 返回</a>
	</form>
</div>
</body>
</html>