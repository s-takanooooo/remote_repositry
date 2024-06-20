<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>売上検索結果表示</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	type="text/css" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>

<jsp:include page="header.jsp" />
<c:if test="${deleteCompleted == 'S0025'}">
	<div
		class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
		role="alert">
		<div class="text- fw-bold fs-5">売上の削除が完了しました</div>
	</div>
</c:if>
<c:if test="${editCompleted == 'S0023'}">
	<div
		class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
		role="alert">
		<div class="text- fw-bold fs-5">売上の編集が完了しました</div>
	</div>
</c:if>
<div class="col-8 offset-2" style="white-space: nowrap;">
	<div></div>
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
							<td><a class="btn btn-primary" role="button"
								href="S0022?id=${status.index}">✓詳細</a></td>
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
	</div>
	<script src="../javascript/bootstrap.bundle.min.js"></script>
	</body>
</html>