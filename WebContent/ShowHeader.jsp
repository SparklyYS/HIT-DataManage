<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RecordBox</title>
</head>
<body>
	<s:iterator value="pdoHeaders.keySet()" var="pdo">
		<h3><s:property value="#pdo"/></h3> <br/>
		<s:iterator value="pdoHeaders[#pdo]" var="head">
			<s:property value="#head"/> &emsp;
		</s:iterator>
		
	</s:iterator>
</body>
</html>