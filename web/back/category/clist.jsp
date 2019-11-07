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
<script type="text/javascript">
	$(function(){
		$("#tt").datagrid({
			url:"${pageContext.request.contextPath}/",    
		    columns:[[    
		        {field:'cid',title:'分类ID',width:100},    
		        {field:'cname',title:'分类名称',width:100},
		        {field:'tools',title:"操作",width:100,formatter:function(value,row,index){
		        	 //value：字段值，即json的value
		        	 //row：当前行数据-json对象。  row.cid 返回当前行的cid
		        	 //index：为当前行索引
		        	 //方法返回值即当前行的数据
		        	return "<a class='easyui-linkbutton' onclick='edit(\""+row.cid+"\")'>修改信息</a>"+
	        		" | <a class='easyui-linkbutton' onclick='del(\""+row.cid+"\")'>删除信息</a>";
		         }}

		    ]],
		    fitColumns:true,
			rownumbers:true,
			pagination:true,
			pageSize:3,
			pageList:[3,10,15],
			singleSelect:true,
			striped:true
		});
	});
	function edit(cid){
		alert(cid);
	}
	function del(cid){
		alert(cid);
	}
</script>
</head>
<body>
	<div id="tt"></div>
</body>
</html>