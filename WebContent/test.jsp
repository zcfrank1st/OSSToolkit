<%@page import="com.oss.operations.*"%>
<%@page import="com.aliyun.openservices.oss.OSSClient"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/test1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%--
	<%
	 OSSClient client = new OSSClient("PTtBteSjexMwejlq","5TiBs4PYTZDgDlBV1vaoV2rpJe9fZ0");
	
	 //Thread t1 = new Thread(new uploadThread(client, "D:/1/1.txt", "zcfrank1st", "22")); 
	 //t1.start();
	 
	 Thread t1 = new Thread(new renameThread(client,"zcfrank1st","helloworld","22"));
	 Thread t2 = new Thread(new renameThread(client,"zcfrank1st","helloworld2","3"));
	 t1.start();
	 t2.start();
	 %>
	 --%>
	 
<%--
<script type="text/javascript">
function Hello(){
    test1.Hello("李四ddd",
       function(data){
           alert(data);
       }
    );
}
</script>
 --%>
<input type="checkbox" value="1" />

<%--<a href="#" onclick="Hello()">Test1</a> --%>
</body>
</html>

<!-- 

 -->