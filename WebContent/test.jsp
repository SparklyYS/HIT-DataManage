<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示结果</title>
</head>
<body>
	<s:iterator value="results" var="event">
		<h3>
			<s:property value="#event.PDOName" />
		</h3>
		<s:iterator value="#event.headers" var="head">
			<s:property value="#head" />
			&emsp;
		</s:iterator>
		link
		<br />
		<s:iterator value="#event.values" var="value">
			<s:property value="#value" />
			&emsp;
		</s:iterator>
		<s:iterator value="#event.link" var="l">
			<s:property value="#l"/> &emsp;
		</s:iterator>
		<br />
		<br />
	</s:iterator>
</body>
</html>