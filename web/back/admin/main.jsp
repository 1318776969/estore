<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>传智商城-后台管理</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		//打开选项卡
		function openTabs(tname,turl){
			//1、获取总选项
			var tt = $("#tt");
			//2、查看对应选项卡是否已经存在
			var result = tt.tabs("exists",tname);
			//3、判断
			if(result){
				//已经存在,选中
				tt.tabs("select",tname);
			}else{
				//未创建，创建
				tt.tabs("add",{
					title:tname,
					selected:true,
					closable:true,
					content:"<iframe src='"+turl+"' frameborder='0' marginheight='0' marginwidth='0' scrolling='auto'  height='95%' width='100%'></iframe>"
				});
			}
		}
	</script>
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',href:'top.jsp',border:false" style="height:40px;"></div>   
    <div data-options="region:'south'" style="height:30px;">系统版本号</div>   
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">   
		    <div title="商品管理" data-options="iconCls:'icon-large-chart'">
		    	<a class="easyui-linkbutton" data-options="width:190,iconCls:'icon-ok'" onclick="openTabs('查询商品','')">查询商品</a> 
		        <a class="easyui-linkbutton" data-options="width:190,iconCls:'icon-ok'" onclick="openTabs('添加商品','')">添加商品</a> 
		    </div>   
		    <div title="分类管理" data-options="iconCls:'icon-large-chart',selected:true">   
		        <a class="easyui-linkbutton" data-options="width:190,iconCls:'icon-ok'" onclick="openTabs('查询分类','${pageContext.request.contextPath}/back/category/clist.jsp')">查询分类</a> 
		        <a class="easyui-linkbutton" data-options="width:190,iconCls:'icon-ok'" onclick="openTabs('添加分类','')">添加分类</a> 
		    </div>   
		    <div title="用户管理" data-options="iconCls:'icon-large-chart'">   
		        <a class="easyui-linkbutton" data-options="width:190,iconCls:'icon-ok'" onclick="openTabs('查询用户','')">查询用户</a> 
		        <a class="easyui-linkbutton" data-options="width:190,iconCls:'icon-ok'" onclick="openTabs('添加用户','')">添加用户</a> 
		    </div>
		    <div title="订单管理" data-options="iconCls:'icon-large-chart'">   
		        <a class="easyui-linkbutton" data-options="width:190,iconCls:'icon-ok'" onclick="openTabs('查询订单','')">查询订单</a> 
		    </div> 
		</div>  
    </div>   
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
    	<div id="tt" class="easyui-tabs" data-options="fit:true"></div>
    </div>   
</body> 
</html>