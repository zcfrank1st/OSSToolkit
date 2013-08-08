<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Bucket</title>
</head>
<body>
	<%
		String bucketName = request.getParameter("add_bucket");
		OSSClient client = (OSSClient)request.getSession().getAttribute("OSSClient");
		boolean flag = true;
		try{
			flag = client.doesBucketExist(bucketName);
		}catch(Exception e){
	%>
			<script type="text/javascript">
			alert("bucket只能包括小写字母，数字，下划线（_）和短横线（-）；必须以小写字母或者数字开头；长度必须在 3-255 字节之间");
			window.location = "index.jsp";
			</script>
	<%	}
		
		if(!flag){
			try{
				client.createBucket(bucketName);
			}catch(Exception e){
	%>
			<script type="text/javascript">
				alert("bucket创建失败!请换bucket名称");
				window.location = "index.jsp";
			</script>
	<%		}finally{%>
				<script type="text/javascript">
					alert("bucket创建成功！");
					window.location = "index.jsp";
				</script>
	<%		}
		}else{
	%>
			<script type="text/javascript">
				alert("bucket创建失败,请重试！");
				window.location = "index.jsp";
			</script>
			
	<%
		}
	%>
</body>
</html>