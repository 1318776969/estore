<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城-登录页面</title>

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
		
		<!-- 登录表单 -->
		<div class="container" style="background-image: url(img/loginbg.jpg);height: 475px;-moz-background-size:100% 100%; background-size:100% 100%;">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-4 col-xs-offset-7 img-rounded" style="height: 320px; background-color: white; margin-top: 50px;">
							<div class="row" style="margin-top: 25px;margin-bottom: 10px;">
								<div class="col-xs-11 col-xs-offset-1">
									<b><font size="4" color="#2B669A">会员登录</font> USER LOGIN</b>
								</div>
								<div class="col-xs-11 col-xs-offset-1">
									<b><font size="2" color="red">${errorMsg}</font></b>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<form class="form-horizontal"
									action="${pageContext.request.contextPath}/user"
									method="post">
										<input type="hidden" name="method" value="login"/>
										<div class="form-group">
										   <label for="username" class="col-sm-3 control-label">用户名</label>
										   <div class="col-sm-7">
										     <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
										   </div>
										</div>
										<div class="form-group">
										   <label for="password" class="col-sm-3 control-label">密码</label>
										   <div class="col-sm-7">
										     <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
										   </div>
										</div>
										
										<div class="form-group">
										   <label for="verifyCode" class="col-sm-3 control-label">验证码</label>
										   <div class="col-sm-5">
										     <input type="text" class="form-control" id="verifyCode" name="verifyCode" placeholder="请输入验证码">
										   </div>
										   <div class="col-sm-3">
										     <img src="img/verifyCode.jpg" width="100%"/>
										   </div>
										</div>
										<div class="form-group">
										   <div class="col-sm-10 col-sm-offset-3">
										     <input type="checkbox" name="autoLogin" value="yes" />自动登录
										     <input type="checkbox" name="remember" value="yes" />记住用户名
										   </div>
										</div>
										<div class="form-group">
										   <div class="col-sm-10 col-sm-offset-3">
										     <input type="submit" value=" 登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录 " class="btn btn-danger">
										   </div>
										</div>
									</form>
								</div>
							</div>
							
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