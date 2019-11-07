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
		$("#t1").datagrid({
			url:"${pageContext.request.contextPath}/admin/plist",
			columns:[[
				    {title:"商品ID",field:"pid",width:"100"},
					{title:"商品名称",field:"pname",width:"100"},
					{title:"商品图片",field:"pimage",width:"100",formatter:function(value,row,index){
																  return "<img src=\""+value+"\" width='100'/>";
																}
					},
					{title:"商品价格",field:"shop_price",width:"100"},
					{title:"商品描述",field:"pdesc",width:"100"},
					{field:'options',title:'操作',width:100,
			        	formatter: function(value,row,index){
			        		return "<a class='easyui-linkbutton' onclick='edit(\""+row.pid+"\")'>修改信息</a>"+
			        		"<a class='easyui-linkbutton' onclick='del(\""+row.pid+"\")'>删除信息</a>";
			       		}
					}
					]],
			fitColumns:true,
			rownumbers:true,
			pagination:true,
			pageSize:5,
			pageList:[5,10,20,30],
			toolbar: [{
					iconCls: 'icon-add',
			        text: '添加商品',
					handler: function(){alert('添加按钮')}
				},'-'],
			striped:true
		});
	});
	
	function edit(pid){
		alert(pid);
	}
	function del(pid){
		alert(pid);
	}
</script>
</head>
<body>
	<table id="t1"></table>
</body>
</html>