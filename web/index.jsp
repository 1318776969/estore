<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>传智商城首页</title>

		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/index.js" ></script>
		<script>
			$(function () {

			    //页面加载完成时，查询展示热门商品列表
				$.ajax({
					method:"POST",
					url:"/estore/product",
					data:{"method":"selectHotPlist"},
					dataType:"json",
                    async:false,
					success:function (data) {
						//1、分别获取热门商品的两个div
						var hp1 = $("#hotPlist1");
                        var hp2 = $("#hotPlist2");
						//2、遍历热门商品列表，每遍历一个商品，就要向列表中追加一个商品
						$(data).each(function (index) {
							//拼接要追加的字符串
							var str = '<div class="col-md-2"><a href="/estore/product?method=searchProductByPid&pid='+this.pid+'"><p align="center"><img src="'+this.pimage+'" width="120%"/>'+this.pname+'<br /><font color="red">￥'+this.shop_price+'</font></p></a></div>';
							//判断
							if(index<=2){

										    //第一行
								hp1.append(str);
							}else{
							    //第二行
                                hp2.append(str);
							}
                        });
                    }
				});
                //页面加载完成时，查询展示最新商品列表
                $.ajax({
                    method:"POST",
                    url:"/estore/product",
                    data:{"method":"selectNewPlist"},
                    dataType:"json",
                    async:false,
                    success:function (data) {
                        //1、分别获取最新商品的两个div
                        var hp1 = $("#newPlist1");
                        var hp2 = $("#newPlist2");
                        //2、遍历热门商品列表，每遍历一个商品，就要向列表中追加一个商品
                        $(data).each(function (index) {
                            //拼接要追加的字符串
                            var str = '<div class="col-md-2"><p align="center"><img src="'+this.pimage+'" width="120%"/>'+this.pname+'<br /><font color="red">￥'+this.shop_price+'</font></p></div>';
                            //判断
                            if(index<=2){
                                //第一行
                                hp1.append(str);
                            }else{
                                //第二行
                                hp2.append(str);
                            }
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
		<!-- 轮播图 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					
					  <div class="carousel-inner" role="listbox">
					    <div class="item active">
					      <img src="img/1.jpg">
					      <div class="carousel-caption">
					      </div>
					    </div>
					    <div class="item">
					      <img src="img/2.jpg">
					      <div class="carousel-caption">
					      </div>
					    </div>
					    <div class="item">
					      <img src="img/3.jpg">
					      <div class="carousel-caption">
					      </div>
					    </div>
					  </div>
					
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 热门商品 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<font size="6">热门商品</font>
					<img src="img/title.jpg" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2 visible-lg">
					<img src="img/big01.jpg" width="100%" class="img-thumbnail"/>
				</div>
				<div class="col-lg-10">
					<div class="row" id="hotPlist1">
						<div class="col-lg-6">
							<img src="img/middle01.jpg" width="100%" class="img-thumbnail"/>
						</div>
						<%--<c:forEach items="${hotPlist}" var="product" begin="0" end="2">
							<div class="col-md-2">
								<p align="center">
									<img src="${product.pimage}" width="120%"/>
									${product.pname}<br />
									<font color="red">￥${product.shop_price}</font>
								</p>
							</div>
						</c:forEach>--%>
						<%--<div class="col-md-2">
							<p align="center">
								<img src="img/small01.jpg" width="120%"/>
								冬瓜<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small02.jpg" width="120%" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small03.jpg" width="120%" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>--%>
					</div>
					<div class="row" id="hotPlist2">
						<%--<c:forEach items="${hotPlist}" var="product" begin="3">
							<div class="col-md-2">
								<p align="center">
									<img src="${product.pimage}" width="120%"/>
										${product.pname}<br />
									<font color="red">￥${product.shop_price}</font>
								</p>
							</div>
						</c:forEach>--%>
						<%--<div class="col-md-2">
							<p align="center">
								<img src="img/small04.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small05.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small06.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small07.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small08.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small09.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>--%>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 广告图片 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/ad.jpg" width="100%" class="img-rounded"/>
				</div>
			</div>
		</div>
		
		<!-- 最新商品 -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<font size="6">最新商品</font>
					<img src="img/title.jpg" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2 visible-lg">
					<img src="img/big01.jpg" width="100%" class="img-thumbnail"/>
				</div>
				<div class="col-lg-10">
					<div class="row" id="newPlist1">
						<div class="col-lg-6">
							<img src="img/middle01.jpg" width="100%" class="img-thumbnail"/>
						</div>
						<%--<div class="col-md-2">
							<p align="center">
								<img src="img/small01.jpg" width="120%"/>
								冬瓜<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small02.jpg" width="120%" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small03.jpg" width="120%" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>--%>
					</div>
					<div class="row" id="newPlist2">
						<%--<div class="col-md-2">
							<p align="center">
								<img src="img/small04.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small05.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small06.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small07.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small08.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>
						<div class="col-md-2">
							<p align="center">
								<img src="img/small09.jpg" />
								<br />
								冬瓜
								<br />
								<font color="red">￥299</font>
							</p>
						</div>--%>
					</div>
				</div>
			</div>
		</div>
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