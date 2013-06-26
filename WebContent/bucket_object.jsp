<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@page import="com.aliyun.openservices.oss.model.OSSObjectSummary"%> 
<%@page import="com.aliyun.openservices.oss.model.ObjectListing"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src='dwr/interface/download.js'></script>
<script src='dwr/engine.js'></script>
<script src='dwr/util.js'></script>
<title><%String str = request.getParameter("bucket"); %><%=str %>-Bucket</title>
</head>
<body>
	<h1>Bucket:<%=str %></h1>
	<% 
	OSSClient c = (OSSClient)request.getSession().getAttribute("OSSClient"); 
	%>
		<table border="1">
			<tr>
				<td>Bucket Name</td>
				<td>Objects</td>
			</tr>
			<tr>
				<td><%=str %></td>
				<td>
					<% 
						ObjectListing listing = c.listObjects(str);
						for (OSSObjectSummary sum : listing.getObjectSummaries()){ 
					%>
					<input type="checkbox" name="checkboxes" value="<%=sum.getKey()%>"><%=sum.getKey()%><br> 
					<%  } %>
				</td>
			</tr>
		</table>

<br>
<input type="button" value="全选" name="checkall" id="checkall">
<script type="text/javascript">
$("#checkall").click(function(){
     $("input[name='checkboxes']").each(function() { this.checked = true; });
});
</script>

<input type="button" value="取消选中文件" id="cancelall" name="cancelall">
<script type="text/javascript">
$("#cancelall").click(function(){
     $("input[name='checkboxes']").attr("checked",false);
});
</script>

<input type="button" value="下载选中文件" onclick="openUrl()">
<!-- http://<%=str%>.oss.aliyuncs.com/objectname -->
<script type="text/javascript">
var bucket = "<%=str%>";
function openUrl(){
	var array = [];
	var i = 0;
	$("input:checked").each(function(){
		array[i]="http://"+bucket+".oss.aliyuncs.com/"+$(this).val();
		i++;
	});
	download.openURLs(array);
}
</script>

<input type="button" value="批量上传" ><!-- 有难度需要仔细想想 --><% //TODO 端点批量上传实现 %>







<input type="button" value="修改选中文件名称" onclick="renamePage()">
<script type="text/javascript">
	function renamePage(){
		var objects =[];
		var count = 0;
		$("input:checked").each(function(){
			objects[count]=$(this).val();
			count++;
		});
		location.href="rename.jsp?bn="+bucket+"&objects="+objects;
	}
</script>

<input type="button" value="修改选中文件HTTP表头"><% //TODO 表头修改实现 %>






<br><br>
<a href="index.jsp">返回</a>
</body>
</html>