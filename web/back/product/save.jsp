<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">商品信息添加</h1>
	<form action="${pageContext.request.contextPath}/" method="post">
		<table align="center" width="80%" cellspacing="1" cellpadding="1">
			<tr>
				<th style="background-color: silver;">商品名称</th>
				<td colspan="2">
					<input type="text" name="pname" size="75"/>
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;">市场价</th>
				<td colspan="2">
					<input type="text" name="market_price" size="75"/>
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;">商城价</th>
				<td colspan="2">
					<input type="text" name="shop_price" size="75"/>
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;">商品图片</th>
				<td colspan="2">
					<input type="text" name="pimage" value="products/1/test.jpg" size="75"/>
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;">是否热门</th>
				<td colspan="2">
					<input type="radio" name="is_hot" value="0" checked="checked"/>不热门
					<input type="radio" name="is_hot" value="1"/>热门
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;">商品分类</th>
				<td colspan="2">
					<select name="cid">
						<option value="1">手机数码</option>
						<option value="2">电脑办公</option>
						<option value="3">家具箱包</option>
					</select>
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;">商品描述</th>
				<td colspan="2">
					<textarea name="pdesc" cols="58" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<th style="background-color: silver;"></th>
				<td colspan="2">
					<input type="submit" value="添加"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>