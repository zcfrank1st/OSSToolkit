<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%>
<%@page import="com.oss.operations.ChangeHttpHeadThread"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Http Headers changing</title>
</head>
<body>
   <%
		OSSClient client = (OSSClient)request.getSession().getAttribute("OSSClient"); 
			String bucketName = request.getParameter("bn");
			String objs = request.getParameter("objs");
			String[] nameArray = objs.split(",");
			int totalNum = nameArray.length;
			String[][] httpHeaders = new String[totalNum][6];
			
			for(int i=0; i<=totalNum-1; i++){
				int j=0;
				httpHeaders[i][j] = request.getParameter(i+"ct");
				System.out.println(httpHeaders[i][j]);
				j++;
				httpHeaders[i][j] = request.getParameter(i+"cl");
				System.out.println(httpHeaders[i][j]);
				j++;
				httpHeaders[i][j] = request.getParameter(i+"e");
				System.out.println(httpHeaders[i][j]);
				j++;
				httpHeaders[i][j] = request.getParameter(i+"cc");
				j++;
				httpHeaders[i][j] = request.getParameter(i+"ce");
				j++;
				httpHeaders[i][j] = request.getParameter(i+"cd");
				
				j=0;
				
				String ct = httpHeaders[i][j++];
				String cl = httpHeaders[i][j++];
				String e = httpHeaders[i][j++];
				String cc = httpHeaders[i][j++];
				String ce = httpHeaders[i][j++];
				String cd = httpHeaders[i][j];
				Thread worker = new Thread(new ChangeHttpHeadThread(client,bucketName,nameArray[i],ct,cl,e,cc,ce,cd));
				worker.start();
			}
	%>
	<h3>修改请求已提交OSS，<a href="index.jsp">返回</a>P.S.点击“http header属性”可查看详情</h3>
</body>
</html>