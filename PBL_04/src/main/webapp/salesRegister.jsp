<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<script src="js/day.js"></script>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-8 offset-2">
			<div class="fs-1 fw-bold">売り上げ登録</div>
		</div>
	</div>
	<div class="row mt-4">
		<!-- アクションの指定 -->
		<form method="post" action="#">
			<div class="row offset-2 col-8 my-4">

				<div class="col-3 text-end fs-3">発売日</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-3">
					<input type="date" name="sale" id="datepicker" value=""
						class="col-12 border rounded px-4 fs-3" required>
				</div>
			</div>


			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">担当</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-8">
					<select class="w-100 border rounded px-4 fs-3" name="responsible">
						<option selected>選択してください</option>
						<!-- itemsに配列を格納　value=配列の値が入る変数-->
						<c:forEach var="staff_name" items="${name}">
							<option value="${staff_name}">${staff_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">商品カテゴリー</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-8">
					<select class="w-100 border rounded px-4 fs-3" name="category">
						<option selected>選択してください</option>
						<c:forEach var="category_name" items="${categories}">
							<option value="${category_name}">${category_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">商品名</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-8">
					<input type="text" name="trade_name"
						class="col-12 border rounded px-4 fs-3" placeholder="商品名" required>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">単価</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-3">
					<input type="text" name="unit_price"
						class="col-12 border rounded px-4 fs-3" placeholder="単価" required>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">個数</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-3">
					<input type="text" name="sale_number"
						class="col-12 border rounded px-4 fs-3" placeholder="個数" required>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">備考</div>
				<div class="col-1">
					<div class="col-10 text-white fs-4"></div>
				</div>

				<div class="col-8">
					<textarea name="note" rows="4"
						class="col-12 border rounded px-4 fs-3" placeholder="備考"></textarea>
				</div>
			</div>

			<div class="col-2 offset-5">
				<button type="submit" class="col-6 btn btn-primary border rounded">✔
					登 録</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>