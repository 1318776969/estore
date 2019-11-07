<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城-信息展示页面</title>

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
		
		<!-- 信息 -->
		<div class="container" style="background-image: url(img/loginbg.jpg);height: 475px;-moz-background-size:100% 100%; background-size:100% 100%;">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-10 col-xs-offset-1 img-rounded" style="background-color: white; margin-top: 50px;">
							<h1 align="center">${msg}</h1>
						</div>
					</div>
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