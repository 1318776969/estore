<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城-商品列表页面</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/index.js" ></script>
		<script>
			$(function () {
				//页面加载完成时，展示浏览记录
				$.ajax({
					method:"POST",
					url:"/estore/product",
					data:{"method":"searchHistoryPlist"},
                    async:false,
					dataType:"json",
					success:function (data) {
						//data---->js数组   每个元素---》product对象
						//1、获取historyList元素
						var div = $("#historyList");
						//2、遍历数组，每遍历一个商品，变成一个div
						$(data).each(function (index) {
							var str = '<div class="col-xs-1"><a href="/estore/product?method=searchProductByPid&pid='+this.pid+'"><p align="center"><img src="'+this.pimage+'" width="100%"/><br /><font color="#3E8F3E" size="1">'+this.pname+'</font><br /><font color="red" size="1">商城价：￥'+this.shop_price+'</font></p></a></div>';
                            div.append(str);
                        });
                    }
				});
            });
		</script>
	</head>

	<body>
		<!-- 网站头部  -->
		<!-- 头部导航条  -->
		<%@ include file="/header.jsp" %>
		
		<!-- 路径导航 -->
		<div class="container">
			<ol class="breadcrumb">
			  <li><a href="index.jsp">首页</a></li>
			  <li><a href="#">手机数码</a></li>
			</ol>
		</div>
		<!-- 商品列表 -->
		<div class="container">
			<c:forEach items="${pi.list}" var="product" varStatus="ss">
				<!--
					如果是第一次或第七次遍历，加入行的开始  <div class="row">
				-->
				<c:if test="${ss.first || ss.count==7}">
					<div class="row">
				</c:if>
				<div class="col-xs-2">
					<a href="/estore/product?method=searchProductByPid&pid=${product.pid}">
						<p align="center">
							<img src="${product.pimage}" width="100%"/>
							<br />
							<font color="#3E8F3E">${product.pname}</font>
							<br />
							<font color="red">商城价：￥${product.shop_price}</font>
						</p>
					</a>
				</div>

				<!--
					如果是第六次或最后一次遍历，加入行的结束  </div>
				-->
				<c:if test="${ss.count==6 || ss.last}">
					</div>
				</c:if>
			</c:forEach>
			<%--<div class="row">
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small09.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small09.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small09.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small09.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small09.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small09.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small01.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small01.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small01.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small01.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small01.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
				<div class="col-xs-2">
					<a href="product_info.html">
						<p align="center">
							<img src="img/small01.jpg" />
							<br />
							<font color="#3E8F3E">商品名称</font>
							<br />
							<font color="red">商城价：￥299.00</font>
						</p>
					</a>
				</div>
			</div>--%>
		</div>
		
		<br />
		<!-- 分页列表 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12 text-center">
					<ul class="pagination">
						<!--
							上一页=当前页-1
							如果当前页==1，不能出现上一页
						-->
						<c:if test="${pi.pageNum!=1}">
							<li>
								<a href="/estore/product?method=searchPlistByCidForPage&cid=${param.cid}&pageNum=${pi.pageNum-1}">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="1" end="${pi.pages}" var="i">
							<!--
								如果当前页==遍历的数字，该数字被选中
							-->
							<c:choose>
								<c:when test="${pi.pageNum==i}">
									<li class="active"><a>${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/estore/product?method=searchPlistByCidForPage&cid=${param.cid}&pageNum=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!--
							下一页=当前页+1
							如果当前页==最后一页，不能出现下一页
						-->
						<c:if test="${pi.pageNum!=pi.pages}">
							<li>
								<a href="/estore/product?method=searchPlistByCidForPage&cid=${param.cid}&pageNum=${pi.pageNum+1}">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>

					  </ul>
				</div>
			</div>
		</div>
		<br />
		<!-- 浏览记录 -->
		<div class="container" style="border: 1px solid #ADADAD;height:180px;">
			<div class="row">
				<div class="col-xs-12" style="padding-top: 10px;">
					<font size="4">浏览记录</font>
				</div>
			</div>
			<div class="row" id="historyList">
				<%--<div class="col-xs-1">
					<a href="/estore/product?method=searchProductByPid&pid=${product.pid}">
						<p align="center">
							<img src="products/1/c_0007.jpg" width="100%"/>
							<br />
							<font color="#3E8F3E">商品名称商品名称</font>
							<br />
							<font color="red">商城价：￥9999999</font>
						</p>
					</a>
				</div>--%>
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