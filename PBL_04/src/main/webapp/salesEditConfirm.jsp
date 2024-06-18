<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>売上詳細編集確認</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-2">
	<div class="fs-1 fw-bold">売上詳細編集確認</div>
</div>

<div class="row mt-4">
	<!-- アクションの指定 -->
	<form method="post" action="S0024?id=${sale.getSale_id() }">
		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">販売日</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<input type="date" name="day" id="datepicker"
					class="col-12 border rounded px-4 fs-3" value="${edit_day}"
					readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">担当</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<select name="staff"
					class="col-12 border rounded px-4 fs-3 form-select" readonly>
					<option selected value="${edit_name}">${edit_name}</option>
				</select>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">商品カテゴリー</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<select name="category"
					class="col-12 border rounded px-4 fs-3 form-select" readonly>
					<option selected value="${edit_sale_category}">${edit_sale_category}</option>
				</select>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">商品名</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<input type="text" name="product_name"
					class="col-12 border rounded px-4 fs-3" value="${edit_trade_name}"
					readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">単価</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-3 form-floating is-invalid">
				<input type="text" name="price"
					class="col-12 border rounded px-4 fs-3" value="${edit_unit_price}"
					readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">個数</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-3 form-floating is-invalid">
				<input type="text" name="product_num"
					class="col-12 border rounded px-4 fs-3" value="${edit_sale_num}"
					readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">備考</div>

			<div class="col-7 offset-1 form-floating is-invalid">
				<textarea name="mail" rows="4"
					class="col-12 border rounded px-4 fs-3" value="備考" readonly>${edit_sale_note}</textarea>
			</div>
		</div>

		<div class="col-4 offset-5">
			<button type="submit" class="col-4 btn btn-primary border rounded">
				✔ O K
				</Kbd>
			</button>
			<a href="SalesEditSession" type="button"
				class="col-4 btn btn-white text-dark border rounded ml-4">キャンセル</a>
		</div>
	</form>
</div>
<div></div>
</body>
</html>