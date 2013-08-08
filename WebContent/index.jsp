<%@page import="com.aliyun.openservices.oss.model.OSSObjectSummary"%>
<%@page import="com.aliyun.openservices.oss.model.ObjectListing"%>
<%@page import="com.aliyun.openservices.oss.model.Bucket"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script> 
<style type="text/css">
	#lean_overlay {
    position: fixed;
    z-index:100;
    top: 0px;
    left: 0px;
    height:100%;
    width:100%;
    background: #000;
    display: none;
}
</style>

<script type="text/javascript">
	$(function(){
		$('a[rel*=leanModal]').leanModal();
	});
</script>

<title>OSS Toolkit Page</title>
</head>
<body>
<div class="container">
<div class="page-header">	
<h1>OSS Overview</h1>
</div>
	<%
	OSSClient client = (OSSClient)request.getSession().getAttribute("OSSClient");
	%>
		<table class="table table-bordered table-striped">
			<tr>
				<td>Buckets</td>
				<td>Objects</td>
			</tr>
			<%
				for (Bucket b : client.listBuckets()){
			%>
			<tr>
				<td><a href="bucket_object.jsp?bucket=<%=b.getName()%>"><%=b.getName() %></a></td>
				<td>
					<% 
						ObjectListing listing = client.listObjects(b.getName());
						for (OSSObjectSummary sum : listing.getObjectSummaries()){
							String s = sum.getKey();
							s = s.replaceAll("\\&", "|");
							s = s.replaceAll("\\#", ">");
							s = s.replaceAll("\\%", "<");
							s = s.replaceAll("\\,", "?");
					%>
					<%=sum.getKey() %>&nbsp;&nbsp;&nbsp;&nbsp;<a href="objHttpAttr.jsp?bucket=<%=b.getName()%>&object=<%=s %>" class="btn btn-small btn-success"><i class="icon-leaf icon-white"></i> Http Header属性</a><br> 
					<%  } %>
				</td>
			</tr>
			<%}%>
		</table>
		<div class="row">
			<div class="span3">
				<a id="go" rel="leanModal" href="#add" onclick="show1()" class ="btn btn-danger"> <i class="icon-plus icon-white"></i> 添加bucket</a>
				<div id=add style="display: none">
					<form action="addBucket.jsp" method="post" name="addbucket_form">
						<input type="text" name="add_bucket" id="add_bucket" placeholder="输入bucket名称"/><br>
						<input type="submit" name="add_bucket_sub" value="确定" class="btn btn-primary"/>
						<a href="index.jsp" class="btn btn-primary"> 取消</a>
					</form>
				</div>
				<script type="text/javascript">
				function show1(){
					$("#add").css({display:block});
				}
				</script>
			</div>
			<div class="span3">
				<a id="go" rel="leanModal" href="#rm" onclick="show2()" class="btn btn-danger"><i class="icon-minus icon-white"></i> 删除bucket</a>
				<div id=rm style="display: none">
					<form action="rmBucket.jsp" method="post" name="rmbucket_form">
						<input type="text" name="rm_bucket" id="rm_bucket" placeholder="输入bucket名称"/><br>
						<input type="submit" name="rm_bucket_sub" value="确定" class="btn btn-primary"/>
						<a href="index.jsp" class="btn btn-primary"> 取消</a>
					</form>
				</div>
				<script type="text/javascript">
					function show2(){
						$("#rm").css({display:block});
					}
				</script>
			</div>
		</div>
		
</div>

</body>
</html>