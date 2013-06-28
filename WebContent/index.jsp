<%@page import="com.aliyun.openservices.oss.model.OSSObjectSummary"%>
<%@page import="com.aliyun.openservices.oss.model.ObjectListing"%>
<%@page import="com.aliyun.openservices.oss.model.Bucket"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSS Toolkit Page</title>
</head>
<body>
<h1>OSS Overview</h1>
	<%
		//String keyID = request.getParameter("id");
		//String keySecret = request.getParameter("secret");
		
		String keyID = "PTtBteSjexMwejlq";  //测试使用
		String keySecret = "5TiBs4PYTZDgDlBV1vaoV2rpJe9fZ0";  //测试使用
		
		OSSClient client = new OSSClient(keyID,keySecret); 
		request.getSession().setAttribute("OSSClient",client);
		//request.getSession().setAttribute("Id",keyID);
		//request.getSession().setAttribute("Secret",keySecret);
		
	%>
		<table border="1">
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
					%>
					<%=sum.getKey()%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="objHttpAttr.jsp?bucket=<%=b.getName()%>&object=<%=sum.getKey()%>"><font size=2>Http Header属性</font></a><br> 
					<%  } %>
				</td>
			</tr>
			<%}%>
		</table>
		
</body>
</html>