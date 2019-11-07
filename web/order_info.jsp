<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城-订单详情页面</title>

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
		
		<!-- 订单详情 -->
		<div class="container">
			<div class="row">

				<div style="margin:0 auto;margin-top:10px;width:950px;">
					<strong>订单详情</strong>
					<table class="table table-bordered">
						<tbody>
							<tr class="warning">
								<th colspan="5">订单编号:9005 </th>
							</tr>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
							<tr class="active">
								<td width="60" width="40%">
									<input type="hidden" name="id" value="22">
									<img src="img/small03.jpg" width="70" height="60">
								</td>
								<td width="30%">
									<a target="_blank">	冬日温情大火锅15寸...</a>
								</td>
								<td width="20%">
									￥298.00
								</td>
								<td width="10%">
									5
								</td>
								<td width="15%">
									<span class="subtotal">￥596.00</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div style="text-align:right;margin-right:120px;">
					商品金额: <strong style="color:#ff6600;">￥596.00元</strong>
				</div>

			</div>

			<div>
				<hr/>
				<form class="form-horizontal" style="margin-top:5px;margin-left:150px;">
					<div class="form-group">
						<label for="username" class="col-sm-1 control-label">地址</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="username" placeholder="请输入收货地址">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-1 control-label">收货人</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="inputPassword3" placeholder="请输收货人">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-1 control-label">电话</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="confirmpwd" placeholder="请输入联系方式">
						</div>
					</div>
				</form>

				<hr/>

				<div style="margin-top:5px;margin-left:150px;">
					<strong>选择银行：</strong>
					<p>
						<br/>
						<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行
						<img src="img/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行
						<img src="img/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行
						<img src="img/bank_img/abc.bmp" align="middle" />
						<br/>
						<br/>
						<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行
						<img src="img/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
						<img src="img/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行
						<img src="img/bank_img/ccb.bmp" align="middle" />
						<br/>
						<br/>
						<input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行
						<img src="img/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
						<img src="img/bank_img/cmb.bmp" align="middle" />

					</p>
					<hr/>
					<p style="text-align:right;margin-right:100px;">
						<a href="javascript:document.getElementById('orderForm').submit();">
							<img src="img/finalbutton.gif" width="204" height="51" border="0" />
						</a>
					</p>
					<hr/>

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