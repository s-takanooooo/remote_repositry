<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	type="text/css" />
<title>売上登録</title>
</head>

<jsp:include page="header.jsp" />
<c:if test="${saleRegisterComplete == 'completed'}">
	<div
		class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
		role="alert">
		<div class="text- fw-bold fs-5">売上の登録が完了しました</div>
	</div>
</c:if>
<!-- 本体 -->
<div class="col-8 offset-2">
	<div class="fs-1 fw-bold">売上登録</div>
</div>

<div class="d-flex flex-row mt-4">
	<!-- アクションの指定 -->
	<form class="col-12" method="post" action="S0010">

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">販売日</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<input type="date" name="sale" id="datepicker" value=""
					class="col-12 border rounded px-4 fs-3" required>
			</div>
		</div>


		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">担当</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7 is-invalid">
				<select class="w-100 border rounded px-4 fs-3 form-select"
					name="responsible">
					<option value="0" selected>選択してください</option>
					<!-- itemsに配列を格納　value=配列の値が入る変数-->
					<c:forEach var="staff_name" items="${name}">
						<option value="${staff_name}">${staff_name}</option>
					</c:forEach>
				</select>
			</div>
			<c:if test="${staffError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">担当者が未選択です。</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">商品カテゴリー</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7 is-invalid">
				<select class="w-100 border rounded px-4 fs-3 form-select"
					name="category">
					<option value="0" selected>選択してください</option>
					<c:forEach var="category_name" items="${categories}">
						<option value="${category_name}">${category_name}</option>
					</c:forEach>
				</select>
			</div>
			<c:if test="${categoryNameError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">商品カテゴリーが未選択です。</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">商品名</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7 form-floating is-invalid">
				<input type="text" name="trade_name"
					class="col-12 border rounded px-4 fs-3" placeholder="商品名" required>
			</div>
			<c:if test="${tradeNameError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">商品名は100字以内で入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">単価</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-3 form-floating is-invalid">
				<input type="text" name="unit_price"
					class="col-12 border rounded px-4 fs-3" placeholder="単価" required>
			</div>
			<c:if test="${unitPriceError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">単価が長すぎます。</div>
				</div>
			</c:if>
			<c:if test="${unitPriceFomartError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">単価を正しく入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">個数</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-3 form-floating is-invalid">
				<input type="text" name="sale_number"
					class="col-12 border rounded px-4 fs-3" placeholder="個数" required>
			</div>
			<c:if test="${saleNumError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">個数が長すぎます。</div>
				</div>
			</c:if>
			<c:if test="${saleNumFomartError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">個数を正しく入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">備考</div>

			<div class="col-7 offset-1 form-floating is-invalid">
				<textarea name="note" rows="4"
					class="col-12 border rounded px-4 fs-3" placeholder="備考"></textarea>
			</div>
			<c:if test="${noteError == false}">
				<div class="invalid-feedback text-center" role="alert">
					<div class="fs-3 fw-bold">備考は400字以内で入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="col-8 offset-2">
			<button type="submit"
				class="col-2 offset-5 btn btn-primary border rounded">✔ 登 録</button>
		</div>
	</form>
</div>
<script src="js/day.js"></script>
</body>
</html>