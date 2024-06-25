<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>売上詳細削除確認画面</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-2">
	<div class="fs-1 fw-bold">売上詳細削除確認画面</div>
</div>

<div class="mt-4">
	<!-- アクションの指定 -->
	<form method="post" action="S0025">
		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">販売日</div>
			<div class="col-8 offset-1">
				<input type="date" name="day" id="datepicker"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${sale.getSale_date() }" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">担当</div>
			<div class="col-8 offset-1">
				<input type="text" name="staff" value="${sale.getName() }"
					class="col-12 border rounded px-4 fs-3 form-select bg-body-secondary"
					readonly>

			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">商品カテゴリー</div>
			<div class="col-8 offset-1">
				<input type="text" name="staff" value="${sale.getCategory_name() }"
					class="col-12 border rounded px-4 fs-3 form-select bg-body-secondary"
					readonly>

			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">商品名</div>
			<div class="col-8 offset-1">
				<input type="text" name="product_name"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${sale.getTrade_name() }" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">単価</div>
			<div class="col-4 offset-1">
				<input type="text" name="price"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${sale.getUnit_price() }" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">個数</div>
			<div class="col-4 offset-1">
				<input type="text" name="product_name"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${sale.getSale_number() }" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">小計</div>
			<div class="col-4 offset-1">
				<input type="text" name="product_name"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${sale.getSubtotal() }" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3   text-dark  text-end fs-3">備考</div>
			<div class="col-8 offset-1">
				<textarea name="mail" rows="4"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary" readonly>${sale.getNote()}</textarea>
			</div>
		</div>

		<div class="col-8 offset-4">
			<button type="submit" class="col-3 btn btn-danger border rounded">
				✖ O K
				</Kbd>
			</button>
			<a href="S0022?id=${sale_num }"
				class="btn btn-secondary col-3 offset-1"> キャンセル</a>
		</div>
		<input type="hidden" name="sale_id" value="1">
	</form>
</div>
</body>

</html>