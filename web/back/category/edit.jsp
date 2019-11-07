<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<h1 align="center">分类信息修改</h1>
	<form id="f1" action="${pageContext.request.contextPath}/" method="post">
		<table align="center" width="80%" cellspacing="1" cellpadding="1">
			<tr>
				<th style="background-color: silver;">分类名称</th>
				<td colspan="2">
					<input class="easyui-textbox" data-options="width:300" name="cname"/> 
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;"></th>
				<td colspan="2">
					<input class="easyui-linkbutton" data-options="iconCls:'icon-lock',width:50" type="submit" value="修改" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>