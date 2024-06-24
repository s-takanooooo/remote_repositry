<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<title>売上登録確認</title>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-3">
	<div class="fs-1 fw-bold">売上登録確認</div>
</div>

<div class="d-flex flex-row mt-4">
	<!-- アクションの指定 -->
	<form class="col-12" method="post" action="S0011">
		<div class="row offset-2 col-8 my-4">

			<div class="col-4 text-end fs-3">販売日</div>
			<div class="col-8">
				<input type="date" name="sale_date" id="datepicker"
					value="<c:out value="${day }"/>"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary" readonly>
			</div>
		</div>


		<div class="row offset-2 col-8 my-4">
			<div class="col-4 text-end fs-3">担当</div>
			<div class=col-8>
				<input type="text"
					class="w-100 border rounded px-4 fs-3 form-select  bg-body-secondary"
					name="responsible" value="${responsible}" readonly>

			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-4 text-end fs-3">商品カテゴリー</div>
			<div class=col-8>
				<input type="text"
					class="w-100 border rounded px-4 fs-3 form-select bg-body-secondary"
					name="category_id" value="${sales_category}" readonly>

			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-4 text-end fs-3">商品名</div>
			<div class="col-8">
				<input type="text" name="trade_name"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="<c:out value="${trade_name}"/>" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-4 text-end fs-3">単価</div>
			<div class="col-3">
				<input type="text" name="unit_price"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="<c:out value="${unit_price}"/>" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-4 text-end fs-3">個数</div>
			<div class="col-3">
				<input type="text" name="sale_number"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="<c:out value="${sales_num}"/>" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-4 text-end fs-3">小計</div>
			<div class="col-3">
				<input type="text"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="<c:out value="${subtotal}"/>" readonly>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-4 text-end fs-3">備考</div>

			<div class="col-8">
				<textarea name="note" rows="4"
					class="col-12 border rounded px-4 fs-3 bg-body-secondary" readonly><c:out
						value="${sales_note}" /></textarea>
			</div>
		</div>
		<div class="col-8 offset-4">
			<button type="submit" class="col-3 btn btn-primary border rounded">✔
				登 録</button>

			<a href="S0012" class="btn btn-secondary col-3 offset-1">キャンセル</a>

		</div>

	</form>
</div>
<div></div>
</body>

</html>