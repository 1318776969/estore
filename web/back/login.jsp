<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath() %>/css/Style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			var m1Src;//图片验证码src
			$(function(){
				//为验证码图片绑定点击切换图片功能
				$("#m1").click(function(){
					var m1 = $(this);
					if(m1Src==undefined){
						m1Src = m1.prop("src");
					}
					m1.prop("src",m1Src+"&t="+new Date().getTime());
				});
			});
		</script>
	</head>

	<body>
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<table width="452" height="290" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td bgcolor="#FFFFFF">
								<table width="452" height="290" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="74">
											<img src="<%=request.getContextPath() %>/img/czxyLogo.png" style="border:1px solid #cccccc;width:452;">
										</td>
									</tr>
									<tr>
										<td align="center" valign="bottom" background="<%=request.getContextPath() %>/img/loginbg.gif">
											<form action="" method="post" target="_parent">
												<table border="0" align="center" cellpadding="2" cellspacing="0">
													<tr align="center">
														<td height="30" colspan="2" style="border-bottom: 1px dotted #cccccc">
															<strong style="font-size: 14px;color:red;">信息展示在该位置</strong>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<font color="000F60"><strong>用户名：</strong> </font>
														</td>
														<td>
															<input type="text" name="logonName" class="test" style="width: 160px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<strong><font color="000F60">密码： </font> </strong>
														</td>
														<td>
															<input type="password" name="logonPwd" class="text" style="width: 160px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<strong><font color="000F60">验证码： </font> </strong>
														</td>
														<td>
															<input type="text" name="verifyCode" class="text" style="width: 50px;"/>
															<img id="m1" src="${pageContext.request.contextPath}/img/vc.jpg" style="height:30px;width:100px;"/>
														</td>
													</tr>
													<tr>
														<td height="30">
														</td>
														<td>
															<input type="submit"  value="登录" class="buttoninput" />
															<input type="reset"  value="重置" class="buttoninput" />
														</td>
													</tr>
												</table>
											</form>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="30" align="center">
													</td>
												</tr>
												<tr>
													<td height="23" align="center"></td>
												</tr>
											</table>
										</td>
									</tr>

								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
