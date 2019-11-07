<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城-注册页面</title>

		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/index.js" ></script>

		<script>
			var f1 = false;//用户名的校验结果
			var f2 = false;//验证码的校验结果
			//判断注册按钮是否可用
			function checkButton() {
                //无论用户名校验完成还是验证码校验完成，都需要判断注册按钮是否可用
                if(f1 && f2){
                    //注册按钮可用
                    $("#registerSubmit").prop("disabled",false);
                }else{
                    //注册按钮不可用
                    $("#registerSubmit").prop("disabled",true);
                }
            }
			$(function () {
				//页面加载完成时，为用户名框体绑定失去焦点事件
				$("#username").blur(function () {
					$.ajax({
						method:"POST",
						url:"/estore/user",
						data:{"method":"checkUsername","username":this.value},
                        async:false,
						success:function (data) {
							//1、获取用户名信息div
							var div = $("#usernameMsg");
							//2、判断填充回显数据
							if(data=="true"){
                                div.html('<span class="label label-success">√</span>');
                                f1 = true;
							}else{
								div.html('<span class="label label-danger">×</span>');
								f1 = false;
							}
							//无论用户名校验完成还是验证码校验完成，都需要判断注册按钮是否可用
                            checkButton();
                        }
					});
                });
				
				//页面加载完成时，为验证码图片绑定点击事件
				$("#vcimg").click(function () {
					//改变src值，就会重新向servlet发送请求  让每次请求路径都不相同
					this.src="${pageContext.request.contextPath}/vc?method=createVc&t="+new Date().getTime();

					//改变验证码校验状态
                    $("#vcMsg").html('<span class="label label-danger">×</span>');
                    f2 = false;
                    checkButton();
                });

				//页面加载完成时，为验证码输入框绑定失去焦点事件
				$("#verifyCode").blur(function () {
					$.ajax({
						method:"POST",
						url:"/estore/vc",
						data:{"method":"checkVc","verifyCode":this.value},
                        async:false,
						success:function (data) {
                            //1、获取用户名信息div
                            var div = $("#vcMsg");
                            //2、判断填充回显数据
                            if(data=="true"){
                                div.html('<span class="label label-success">√</span>');
                                f2 = true;
                            }else{
                                div.html('<span class="label label-danger">×</span>');
                                f2 = false;
                            }
							//无论用户名校验完成还是验证码校验完成，都需要判断注册按钮是否可用
                            checkButton();
                        }
					});
                });
            });
		</script>
	</head>

	<body>
		<!-- 网站头部  -->
		<!-- 头部导航条  -->
		<%@ include file="/header.jsp" %>
		
		<!-- 注册表单 -->
		<div class="container" style="background-image: url(img/regist_bg.jpg);height: 600px;">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-8 col-xs-offset-2" style="height: 520px; border:5px solid #ADADAD; background-color: white; margin-top: 50px;">
							<div class="row" style="margin-top: 25px;margin-bottom: 10px;">
								<div class="col-xs-11 col-xs-offset-1">
									<b><font size="4" color="#2B669A">会员注册</font> USER REGISTER</b>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-9 col-xs-offset-1">
									<form class="form-horizontal"
									action="${pageContext.request.contextPath}/user"
									method="post">
										<input type="hidden" name="method" value="register"/>
										<div class="form-group">
										   <label for="username" class="col-sm-2 control-label">用户名</label>
										   <div class="col-sm-9">
										     <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
										   </div>
										   <div class="col-sm-1" id="usernameMsg">
										    	<!-- <span class="label label-success">√</span>
												<span class="label label-danger">×</span> -->
										    </div>
										</div>
										<div class="form-group">
										   <label for="password" class="col-sm-2 control-label">密码</label>
										   <div class="col-sm-10">
										     <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
										   </div>
										</div>
										<div class="form-group">
										   <label for="repassword" class="col-sm-2 control-label">确认密码</label>
										   <div class="col-sm-10">
										     <input type="password" class="form-control" id="repassword" name="repassword" placeholder="请输入确认密码">
										   </div>
										</div>
										<div class="form-group">
										   <label for="email" class="col-sm-2 control-label">Email</label>
										   <div class="col-sm-10">
										     <input type="email" class="form-control" id="email" name="email" placeholder="请输入Email">
										   </div>
										</div>
										<div class="form-group">
										   <label for="name" class="col-sm-2 control-label">姓名</label>
										   <div class="col-sm-10">
										     <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
										   </div>
										</div>
										<div class="form-group">
										   <label for="name" class="col-sm-2 control-label">性别</label>
										   <div class="col-sm-10" style="margin-top: 5px;">
										     <input type="radio" name="sex" value="man" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										     <input type="radio" name="sex" value="woman"/>女
										   </div>
										</div>
										<div class="form-group">
										   <label for="birthday" class="col-sm-2 control-label">出生日期</label>
										   <div class="col-sm-10">
										     <input type="date" class="form-control" id="birthday" name="birthday" placeholder="请输入出生日期">
										   </div>
										</div>
										<div class="form-group">
										   <label for="verifyCode" class="col-sm-2 control-label">验证码</label>
										   <div class="col-sm-4">
										     <input type="text" class="form-control" id="verifyCode" name="verifyCode" placeholder="请输入验证码">
										   </div>
										   <div class="col-sm-5">
										     <img id="vcimg" src="${pageContext.request.contextPath}/vc?method=createVc"/>
										   </div>
										   <div class="col-sm-1" id="vcMsg">
										    	<!-- <span class="label label-success">√</span>
												<span class="label label-danger">×</span> -->
										    </div>
										</div>
										<div class="form-group">
										   <div class="col-sm-10 col-sm-offset-2">
										     <input id="registerSubmit" disabled="disabled" type="submit" value=" 注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册 " class="btn btn-danger btn-lg">
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