<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function () {
	    //页面加载完成时，尝试获取用户选中的cid
		var userCid = "${param.cid}";
	    //ajax请求把分类数据加载出来
		$.ajax({
			method:"POST",
			url:"/estore/product",
			data:{"method":"searchAllClist"},
            async:false,
			dataType:"json",
			success:function (data) {
				//data---->js数组。   每一个都是category对象
				//1、获取ul标签
				var ul = $("#clist");
				//2、遍历分类数组，每遍历一个分类，向ul中追加一个li
				$(data).each(function () {
				    //判断高亮选中。（如果用户选中了某个分类，该分类应该被高亮选中）
					var li = "";
					if(userCid==this.cid){
                        li = '<li class="active"><a href="/estore/product?method=searchPlistByCidForPage&cid='+this.cid+'&pageNum=1">'+this.cname+'</a></li>';
					}else{
                        li = '<li><a href="/estore/product?method=searchPlistByCidForPage&cid='+this.cid+'&pageNum=1">'+this.cname+'</a></li>';
					}
                    ul.append(li);
                });
            }
		});
    });
</script>
<!-- 网站头部  -->
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<img src="img/czxyLogo.png" />
		</div>
		<div class="col-md-4">
			<img src="img/header.png"/> 
		</div>
		<div class="col-md-4" style="padding-top: 20px;">
			<ul class="list-inline" >
				<c:choose>
					<c:when test="${not empty user}">
						<%--session中user对象不为空，存在，说明登录成功--%>
						<li>欢迎您：${user.username}</li>
						<li><a href="${pageContext.request.contextPath}/user?method=logout" class="btn btn-danger glyphicon glyphicon-plus">退出登录</a></li>
					</c:when>
					<c:otherwise>
						<%--未登录--%>
						<li><a href="login.jsp" class="btn btn-primary glyphicon glyphicon-user">登录</a></li>
						<li><a href="register.jsp" class="btn btn-danger glyphicon glyphicon-plus">注册</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="cart.jsp" class="btn btn-primary glyphicon glyphicon-shopping-cart" onmouseover="showCartItem(this)">购物车<span class="badge">5</span></a></li>
			</ul>
		</div>
	</div>
</div>

<!-- 头部导航条  -->
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<nav class="navbar navbar-inverse">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="index.jsp">首页</a>
			    </div>
			
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav" id="clist">
			        <%--<li class="active"><a href="product_list.html">手机数码<span class="sr-only">(current)</span></a></li>
			        <li><a href="#">电脑办公</a></li>
			        <li><a href="#">家具家居</a></li>--%>
			      </ul>
			      <form class="navbar-form navbar-right" role="search">
			        <div class="form-group">
			          	<div class="input-group">
    								<input id="wordsSearch" type="text" class="form-control" placeholder="Search" onkeyup="searchWords(this)" onclick="showWordsList()">
    								<div class="input-group-addon" onclick="itemulClose()">×</div>
  							</div>
			        </div>
			        <button type="submit" class="btn btn-default">Submit</button>
			        <!-- 显示查询信息的div -->
			        <div id="completeShow" style="position:absolute;z-index:998;width:200px;">
			        	<ul id='itemul' class='list-group'>
			        		<!--
			        		<li class='list-group-item'><a href='#'>查询结果1</a></li>
			        		<li class='list-group-item'><a href='#'>查询结果2</a></li>
			        		<li class='list-group-item'><a href='#'>查询结果3</a></li>
			        		<li class='list-group-item'><a href='#'>查询结果4</a></li>
			        		<li class='list-group-item'><a href='#'>查询结果5</a></li>
			        		-->
			        	</ul>
			        </div>
			      </form>
			    </div>
			  </div>
			</nav>
		</div>
		
	</div>
</div>