<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pdos</title>
</head>
<body>
	<s:url var="addpdourl"  value="AddPDO.jsp">
	</s:url>
	<s:a href="%{addpdourl}">添加PDO</s:a>
	&emsp;
	<s:url var="addeventurl"  value="AddEventPass.jsp">
	</s:url>
	<s:a href="%{addeventurl}">添加PDO</s:a>
	<br/>
	<s:iterator value="pdos" var="p">
		<s:url var="detailurl"  value="ShowEventAction">
			<s:param name="PDOName" value="%{#p.PDOName}"></s:param>
		</s:url>
		<s:a href="%{detailurl}"><s:property value="%{#p.PDOName}"/></s:a>
		 &emsp; &emsp; &emsp; 
		<s:date name="#p.t" format="yyyy-MM-dd HH:mm:ss"/> 
	</s:iterator>
</body>
</html>