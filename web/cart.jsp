<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>传智商城-购物车页面</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <style>
        th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        //从购物车删除某个商品
        function delProductFromCart(pid) {
            if (confirm("是否忍心删除人家？")) {
                //删除
                location.href = "${pageContext.request.contextPath}/product?method=delProductFromCart&pid=" + pid;
            }
        }

        //清空购物车
        function clearCart() {
            if (confirm("是否忍心删除我们啊？")) {
                //删除
                location.href = "${pageContext.request.contextPath}/product?method=clearCart";
            }
        }

        //修改某个商品的购买数量
        function modifyCart(pid, count) {
            <%--location.href="${pageContext.request.contextPath}/product?method=modifyCart&pid="+pid+"&count="+count;--%>
            $.ajax({
                method: "POST",
                url: "/estore/product",
                data: {"method": "modufyCart", "pid": pid, "count": count},
                async: false,
                success: function (data) {
                   var x=data.split(",");
                    $("#total").html(x[1]);
                    $("#" + pid+"1").html(x[0]);
                }
            })
        }
        function run1() {
            if (confirm("是否确认删除")) {
                var r = $("[type='checkbox']:checked");
                if (r.size() == 0) {
                    alert("请先选择")
                } else {
                    var pid = "";
                    r.each(function () {
                        pid += this.id + ",";
                    });
                    r.parent().parent().html("");
                    $.ajax({
                        method: "POST",
                        url: "/estore/product",
                        data: {"method": "run2", "pid": pid},

                    })
                }

            }

        }
    </script>
</head>

<body>
<!-- 网站头部  -->
<!-- 头部导航条  -->
<%@ include file="/header.jsp" %>

<!-- 购物车 -->
<div class="container">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <font size="4"><b>购物车详情</b></font>
            <table class="table table-hover" width="100%" border="1" style="border:1px solid #E2E2DC;height: 40px;">
                <tr style="background-color: #FDF8E4;">
                    <th></th>
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                <c:if test="${empty cart || empty cart.map}">
                    <tr style="background-color: #FDF8E4;">
                        <th colspan="6">亲，请先购物后，再来操作</th>
                    </tr>
                </c:if>
                <c:forEach items="${cart.map}" var="entry">
                    <tr>
                        <td><input type="checkbox" id="${entry.value.product.pid}"></td>
                        <td style="width: 80px;"><img src="${entry.value.product.pimage}" width="100%"/></td>
                        <td>
                            <a href="">${entry.value.product.pname}</a>
                        </td>
                        <td>
                            ￥${entry.value.product.shop_price}
                        </td>
                        <td>
                            <input type="text" name="count" value="${entry.value.count}" size="5"
                                   onblur="modifyCart('${entry.key}',this.value)"/>

                        </td>
                        <td>
                            ￥<span id="${entry.value.product.pid}1">${entry.value.subtotal}</span>
                        </td>
                        <td>
                            <button class="btn btn-danger" onclick="delProductFromCart('${entry.key}')">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p align="right">
                <b>商品金额：<font color="#FF6A0A">￥<span id="total">${cart.total}</span>元</font></b>
                <br/>
                <a onclick="run1()" class="btn btn-danger glyphicon glyphicon-remove">删除选中</a>
                <a onclick="clearCart()" class="btn btn-danger glyphicon glyphicon-remove">清空购物车</a>
                <a href="${pageContext.request.contextPath}/orders?methood=addOrders" class="btn btn-success glyphicon glyphicon-ok">提交订单</a>
            </p>
        </div>
    </div>
</div>

<br/>
<!-- 底部图片 -->
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <img src="img/footer.jpg" width="100%" class="img-rounded"/>
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