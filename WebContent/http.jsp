<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<title>
		<%
			String str = request.getParameter("bn"); 
			String objs = request.getParameter("objects"); 
		%>
		<%=str %>-Bucket</title>
</head>
<body>
<h1>Change Bucket:<%=str %>'s Objects' Http Headers</h1>
	<form action="httpAction.jsp?bn=<%=str %>&objs=<%=objs %>" method="post">
		<table border="1">
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
						Content-Type:<input type="text" name="<%=i+"ct" %>" value="application/octet-stream"  class="in" style="color:#999;" />;
						Content-Length:<input type="text" name="<%=i+"cl" %>" value="1" class="in" style="color:#999;"/>;
						Expires:<input type="text" name="<%=i+"e" %>" value="1" class="in" style="color:#999;"/>;
						Cache-Control:<input type="text" name="<%=i+"cc" %>" value="no-cache" class="in" style="color:#999;"/>;
						Content-Encoding:<input type="text" name="<%=i+"ce" %>" value="deflate" class="in" style="color:#999;"/>;
						Content-Disposition:<input type="text" name="<%=i+"cd" %>" value="attachment" class="in" style="color:#999;"/>;
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
		<input type="submit" name="httpheaders" value="Change">
		<input type="reset" name="reset" value="Cancel">
		<br>
		<a href=# onclick="javascript:history.go(-1);">返回</a>
	</form>
</body>
</html>