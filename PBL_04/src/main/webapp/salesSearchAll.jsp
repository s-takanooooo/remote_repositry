<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>売上検索結果表示｜物品売り上げ管理システム</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>

<jsp:include page="header.jsp" />
	<div class="container-fluid">
		<div class="d-flex justify-content-start">
			<h1 class="fw-bold mt-5">売上検索結果表示</h1>
		</div>
		<div class="container-fluid">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">操作</th>
						<th scope="col">No</th>
						<th scope="col">販売日</th>
						<th scope="col">担当</th>
						<th scope="col">商品カテゴリー</th>
						<th scope="col">商品名</th>
						<th scope="col">単価</th>
						<th scope="col">個数</th>
						<th scope="col">小計</th>
					</tr>
				</thead>
				<c:forEach var="item" items="${sales }" varStatus="status"> 
				<tbody>
					<tr>
						<td><a class="btn btn-primary" role="button" href="SalesDetail?id=${status.index}" >✓詳細</a></td>
						<td><c:out value="${item.getSale_id() }" /></td>
						<td><c:out value="${item.getSale_date() }" /></td>
						<td><c:out value="${item.getName() }" /></td>
						<td><c:out value="${item.getCategory_name() }" /></td>
						<td><c:out value="${item.getTrade_name() }" /></td>
						<td><c:out value="${item.getUnit_price() }" /></td>
						<td><c:out value="${item.getSale_number() }" /></td>
						<td><c:out value="${item.getSubtotal()}" /></td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
		<script src="../javascript/bootstrap.bundle.min.js"></script>
</body>

</html>