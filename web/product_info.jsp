<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城-商品详情页面</title>

		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/index.js" ></script>
	</head>

	<body>
		<!-- 网站头部  -->
		<!-- 头部导航条  -->
		<%@ include file="/header.jsp" %>
		
		<!-- 路径导航 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<ol class="breadcrumb">
					  <li><a href="index.jsp">首页</a></li>
					  <li><a href="#">手机数码</a></li>
					</ol>
				</div>
			</div>
		</div>
		<!-- 商品信息 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<!-- 商品基本信息  -->
					<div class="row">
						<div class="col-xs-5">
							<img src="${product.pimage}" width="100%" style="border:1px dotted #E5EAEB"/>
						</div>
						<div class="col-xs-5 col-xs-offset-1">
							<b><font size="4">${product.pname}</font></b>
							<hr style="border:1px dotted #E5EAEB"/>
							<font size="2" color="red">限时促销</font><br />
							<b>价格：</b>
							<b><font size="5" color="#535353" style="background-image: url(img/cha.png);background-size:100% 100%;">￥${product.market_price}</font></b>
							<b><font size="6" color="#CB3E3A" style="margin-left: -10px;">￥${product.shop_price}</font></b>
							<div class="container-fluid" style="border:1px dotted #ECDFB8;height: 155px;background-color: #FFFFE7;">
								<form id="cartForm"
									  action="${pageContext.request.contextPath}/product"
								      method="post">
									<div class="row">
										<div class="col-xs-10 col-xs-offset-1" style="margin-top: 30px;">
												<input type="hidden" name="method" value="addCart"/>
												<input type="hidden" name="pid" value="${product.pid}"/>
												购买数量：
												<span class="glyphicon glyphicon-minus" style="cursor: pointer;" onclick="cartCountNum('-')"></span>
												<input type="text" id="count" name="count" value="1" size="5" style="text-align: center;"/>
												<span class="glyphicon glyphicon-plus" style="cursor: pointer;" onclick="cartCountNum('+')"></span>
												<br />
												<hr style="border:1px dotted #E5EAEB"/>
												
											
										</div>
									</div>
									<div class="row">
										<div class="col-xs-2 col-xs-offset-2">
											<a onclick="$('#cartForm').submit()" class="btn btn-danger glyphicon glyphicon-shopping-cart">加入购物车</a>
										</div>
										<div class="col-xs-2 col-xs-offset-2">
											<a onclick="$('#cartForm').submit()" class="btn btn-warning glyphicon glyphicon-tag">收 藏 </a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 商品描述 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1 text-center img-rounded" style="background-color: #F5F5F5;height: 30px;">
					<font size="4"><b>商品描述</b></font>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1 img-rounded">
					<font size="2"><b>${product.pdesc}</b></font>
				</div>
			</div>
		</div>
		
		<br />
		<!-- 浏览记录 -->
		<div class="container" style="border: 1px solid #ADADAD;height:180px; width: 70%;">
			<div class="row">
				<div class="col-xs-12" style="padding-top: 10px;">
					<font size="4">浏览记录</font>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<img src="img/small09.jpg" />
				</div>
			</div>
		</div>
		<br />
		<!-- 底部图片 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/footer.jpg" width="100%" class="img-rounded" />
				</div>
			</div>
		</div>
		
		<!-- 底部 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12 text-center">
					<ul class="list-inline">
						<li><a href="">关于我们</a></li>
						<li><a href="">联系我们</a></li>
						<li><a href="">招贤纳士</a></li>
						<li><a href="">法律声明</a></li>
						<li><a href="">友情链接</a></li>
						<li><a href="">支付方式</a></li>
						<li><a href="">配送方式</a></li>
						<li><a href="">服务声明</a></li>
						<li><a href="">广告声明</a></li>
					</ul>
					<b>
						Copyright &copy; 2005-2018 传智商城 版权所有
					</b>
				</div>
			</div>
		</div>
		
	</body>

</html>