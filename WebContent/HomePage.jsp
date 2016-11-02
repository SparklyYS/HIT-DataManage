<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>主页</title>
</head>
<body>
	<h1>Welcome</h1>
	<s:iterator value="messages" var="m">
		<s:property value="%{#m.mess}"/> &emsp; 
		<s:date name="#m.t" format="yyyy-MM-dd HH:mm:ss"/> 
	</s:iterator>
	<br />
	<s:url var="homeurl"  value="HomeAction">
	</s:url>
	<s:a href="%{homeurl}">主页</s:a>
	<br />
	
	<s:url var="pdourl"  value="ShowPDOAction">
	</s:url>
	<s:a href="%{pdourl}">我的文件</s:a>
	
	<s:debug></s:debug>
</body>
</html>