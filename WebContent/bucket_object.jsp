<%@page import="com.aliyun.openservices.oss.model.ObjectMetadata"%>
<%@page import="com.aliyun.openservices.oss.model.OSSObject"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@page import="com.aliyun.openservices.oss.model.OSSObjectSummary"%> 
<%@page import="com.aliyun.openservices.oss.model.ObjectListing"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script> 
<script src='dwr/interface/download.js'></script>
<script src='dwr/engine.js'></script>
<script src='dwr/util.js'></script>

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

<title><%String str = request.getParameter("bucket"); %><%=str %>-Bucket</title>
</head>
<body>
<div class="container">
	<div class="page-header"><h1>Bucket:<%=str %></h1></div>
<%	
	OSSClient c = (OSSClient)request.getSession().getAttribute("OSSClient"); 
%>
		<table class="table table-bordered table-striped">
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
							
							//下载前设置http头content-disposition为attachment
							OSSObject obj = c.getObject(str, sum.getKey());
							ObjectMetadata meta = new ObjectMetadata();
							meta.setContentDisposition("attachment");
							obj.setObjectMetadata(meta);
					%>
					<input type="checkbox" name="checkboxes" value="<%=sum.getKey()%>"><%=sum.getKey()%><br> 
					<%  } %>
				</td>
			</tr>
		</table>

<br>
<input type="button" value="全选" name="checkall" id="checkall" class="btn btn-small btn-primary">
<script type="text/javascript">
$("#checkall").click(function(){
     $("input[name='checkboxes']").each(function() { this.checked = true; });
});
</script>

<input type="button" value="取消选中文件" id="cancelall" name="cancelall" class="btn btn-small btn-primary">
<script type="text/javascript">
$("#cancelall").click(function(){
     $("input[name='checkboxes']").attr("checked",false);
});
</script>

<input type="button" value="下载选中文件" onclick="openUrl()" class="btn btn-small btn-primary">
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

<input type="button" value="修改选中文件名称" onclick="renamePage()" class="btn btn-small btn-primary">
<script type="text/javascript">
	function renamePage(){
		var objects =[];
		var count = 0;
		var reg1=new RegExp(",","g"); 
		var reg2=new RegExp("&","g");
		var reg3=new RegExp("#","g");
		var reg4=new RegExp("%","g");
		$("input:checked").each(function(){
			var filename = $(this).val();
			if(filename.indexOf(",")>=0 || filename.indexOf("&")>=0 || filename.indexOf("#")>=0 ||
					filename.indexOf("%")>=0){
				filename = filename.replace(reg1,"?");
				filename = filename.replace(reg2,"|");
				filename = filename.replace(reg3,">");
				filename = filename.replace(reg4,"<");
			}
			objects[count] = filename;
			count++;
		});
		if (objects.length != 0){
			location.href="rename.jsp?bn="+bucket+"&objects="+objects;
		}else{
			alert("请选择文件！");
		}
	}
</script>

<input type="button" value="修改选中文件HTTP表头" onclick="changeHttpHead()" class="btn btn-small btn-primary">
<script type="text/javascript">
	function changeHttpHead(){
		var objects =[];
		var count = 0;
		var reg1=new RegExp(",","g"); 
		var reg2=new RegExp("&","g");
		var reg3=new RegExp("#","g");
		var reg4=new RegExp("%","g");
		$("input:checked").each(function(){
			var filename = $(this).val();
			if(filename.indexOf(",")>=0 || filename.indexOf("&")>=0 || filename.indexOf("#")>=0 ||
					filename.indexOf("%")>=0){
				filename = filename.replace(reg1,"?");
				filename = filename.replace(reg2,"|");
				filename = filename.replace(reg3,">");
				filename = filename.replace(reg4,"<");
			}
			objects[count] = filename;
			count++;
		});
		if (objects.length != 0){
			location.href="http.jsp?bn="+bucket+"&objects="+objects;
		}else{
			alert("请选择文件！");
		}	
	}
</script>

<input type="button" value="删除选中文件" onclick="del()" class="btn btn-small btn-primary">
<script type="text/javascript">
	function del(){
		var objects =[];
		var count = 0;
		var reg1=new RegExp(",","g"); 
		var reg2=new RegExp("&","g");
		var reg3=new RegExp("#","g");
		var reg4=new RegExp("%","g");
		$("input:checked").each(function(){
			var filename = $(this).val();
			if(filename.indexOf(",")>=0 || filename.indexOf("&")>=0 || filename.indexOf("#")>=0 ||
					filename.indexOf("%")>=0){
				filename = filename.replace(reg1,"?");
				filename = filename.replace(reg2,"|");
				filename = filename.replace(reg3,">");
				filename = filename.replace(reg4,"<");
			}
			objects[count] = filename;
			count++;
		});
		if (objects.length != 0){
			location.href="del.jsp?bn="+bucket+"&objects="+objects;
		}else{
			alert("请选择文件！");
		}	
	}
</script>

<br><br>
<a id="go" rel="leanModal" href="#test" onclick="show()" class="btn btn-small btn-success">文件上传</a>
<script type="text/javascript">
function show(){
	$("#test").css({display:block});
}
</script>

<div id=test style="display: none">
<form action="uploadStat.jsp?bucket=<%=str %>" method="post" name="form" enctype="multipart/form-data">
<input type="file" value="upload" name="file0" id="file0"/>
<input type="button" value="添加" onclick="add()" class="btn btn-success"/>

<script type="text/javascript">	
    var num = 1;
	function add(){
		var tag = "file" + num;
		var content = "<br><input type='file' value='upload' name=" + tag + " id=" + tag +" />";
		$("#file0").after(content);
		num++;
	}
</script>

<br><br>
<input type="submit" name="submit" value="确定" class="btn btn-primary"/>
</form>
</div>

<br><br>
<a href="index.jsp" class="btn btn-mini btn-info"><i class="icon-leaf icon-white"></i> 返回</a>
</div>
</body>
</html>