<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城-订单列表页面</title>

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
					  <li><a href="index.html">首页</a></li>
					  <li><a href="#">我的订单</a></li>
					</ol>
				</div>
			</div>
		</div>
		<!-- 订单列表 -->
		<div class="container">
			<div class="row">
				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<table class="table table-bordered">
						<tbody>
							<tr class="success">
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
									<a target="_blank">冬日温情大火锅15寸...</a>
								</td>
								<td width="20%">
									￥298.00
								</td>
								<td width="10%">
									5
								</td>
								<td width="15%">
									<span class="subtotal"><font color="red"><b>￥596.00</b></font></span>
								</td>
							</tr>
						</tbody>
						<tbody>
							<tr class="success">
								<th colspan="5">订单编号:9004 </th>
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
									<a target="_blank">冬日温情大火锅15寸...</a>
								</td>
								<td width="20%">
									￥298.00
								</td>
								<td width="10%">
									5
								</td>
								<td width="15%">
									<span class="subtotal"><font color="red"><b>￥596.00</b></font></span>
								</td>
							</tr>
						</tbody>
						<tbody>
							<tr class="success">
								<th colspan="5">订单编号:9003 </th>
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
									<a target="_blank">冬日温情大火锅15寸...</a>
								</td>
								<td width="20%">
									￥298.00
								</td>
								<td width="10%">
									5
								</td>
								<td width="15%">
									<span class="subtotal"><font color="red"><b>￥596.00</b></font></span>
								</td>
							</tr>
						</tbody>
						<tbody>
							<tr class="success">
								<th colspan="5">订单编号:9002 </th>
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
									<a target="_blank">冬日温情大火锅15寸...</a>
								</td>
								<td width="20%">
									￥298.00
								</td>
								<td width="10%">
									5
								</td>
								<td width="15%">
									<span class="subtotal"><font color="red"><b>￥596.00</b></font></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div style="text-align: center;">
				<ul class="pagination">
					<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li>
						<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
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