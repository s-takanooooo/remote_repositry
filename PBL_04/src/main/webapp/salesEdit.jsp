<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>売上詳細編集</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<script src="js/day.js"></script>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-2">
	<div class="fs-1 fw-bold">売上詳細編集</div>
</div>
<div class="mt-4">
	<!-- アクションの指定 -->
	<form method="post"
		action="S0023?id=${sessionScope.sale.getSale_id() }" id="form">
		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">販売日</div>
			<div class="col-1">
				<div
					class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
			</div>
			<div class="col-8">
				<c:if test="${getSession==0 }">
					<input type="date" name="day" id="datepicker"
						class="col-12 border rounded px-4 fs-3"
						value="${sale.getSale_date() }" required>
				</c:if>
				<c:if test="${getSession==1 }">
					<input type="date" name="day" id="datepicker"
						class="col-12 border rounded px-4 fs-3" value="${edit_day }"
						required>
				</c:if>
			</div>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">担当</div>
			<div class="col-1">
				<div
					class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
			</div>
			<div class="col-8 is-invalid">
				<select name="staff"
					class="col-12 border rounded px-4 fs-3 form-select" required>
					<c:if test="${getSession ==0}">
						<option value="${sale.getName() }" selected>${sale.getName() }</option>
					</c:if>
					<c:if test="${getSession ==1}">
						<option value="${edit_name }" selected>${edit_name }</option>
					</c:if>
					<!-- itemsに配列を格納　value=配列の値が入る変数-->
					<c:forEach var="staff_name" items="${staff}">
						<option value="${staff_name}">${staff_name}</option>
					</c:forEach>
				</select>
			</div>
			<c:if test="${staffError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">担当が未選択です。</div>
				</div>
			</c:if>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">商品カテゴリー</div>
			<div class="col-1">
				<div
					class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
			</div>
			<div class="col-8 is-invalid">
				<select name="category"
					class="col-12 border rounded px-4 fs-3 form-select" required>
					<c:if test="${getSession ==0}">
						<option value="${sale.getCategory_name() }" selected>${sale.getCategory_name() }</option>
					</c:if>
					<c:if test="${getSession ==1}">
						<option value="${edit_sale_category }" selected>${edit_sale_category }</option>
					</c:if>
					<!-- itemsに配列を格納　value=配列の値が入る変数-->
					<c:forEach var="category_name" items="${category}">
						<option value="${category_name}">${category_name}</option>
					</c:forEach>
				</select>
			</div>
			<c:if test="${categoryNameError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">商品カテゴリーが未選択です。</div>
				</div>
			</c:if>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">商品名</div>
			<div class="col-1">
				<div
					class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
			</div>
			<div class="col-8 form-floating is-invalid">
				<c:if test="${getSession==0 }">
					<input type="text" name="product_name"
						class="col-12 border rounded px-4 fs-3"
						value="${sale.getTrade_name() }" required>
				</c:if>
				<c:if test="${getSession==1 }">
					<input type="text" name="product_name"
						class="col-12 border rounded px-4 fs-3"
						value="${edit_trade_name }" required>
				</c:if>
			</div>
			<c:if test="${tradeNameError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">商品名は100字以内で入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">単価</div>
			<div class="col-1">
				<div
					class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
			</div>
			<div class="col-4 form-floating is-invalid">
				<c:if test="${getSession==0 }">
					<input type="text" name="price"
						class="col-12 border rounded px-4 fs-3"
						value="${sale.getUnit_price() }" required>
				</c:if>
				<c:if test="${getSession==1 }">
					<input type="text" name="price"
						class="col-12 border rounded px-4 fs-3"
						value="${edit_unit_price }" required>
				</c:if>
			</div>
			<c:if test="${unitPriceError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">単価が長すぎます。</div>
				</div>
			</c:if>
			<c:if test="${unitPriceFomartError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">単価を正しく入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="col-3 text-end fs-3">個数</div>
			<div class="col-1">
				<div
					class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
			</div>
			<div class="col-4 form-floating is-invalid">
				<c:if test="${getSession==0 }">
					<input type="text" name="product_num"
						class="col-12 border rounded px-4 fs-3"
						value="${sale.getSale_number() }" required>
				</c:if>
				<c:if test="${getSession==1 }">
					<input type="text" name="product_num"
						class="col-12 border rounded px-4 fs-3" value="${edit_sale_num }"
						required>
				</c:if>
			</div>
			<c:if test="${saleNumError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">個数が長すぎます。</div>
				</div>
			</c:if>
			<c:if test="${saleNumFomartError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">個数を正しく入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="row offset-2 col-8 my-4">
			<div class="offset-3 col-1">
				<div class="col-10  text-dark  text-center fs-3">備考</div>
			</div>
			<div class="col-8 form-floating is-invalid">
				<c:if test="${getSession==0 }">
					<textarea name="mail" rows="4"
						class="col-12 border rounded px-4 fs-3"><c:out
							value="${sale.getNote() }"></c:out></textarea>
				</c:if>
				<c:if test="${getSession==1 }">
					<textarea name="mail" rows="4"
						class="col-12 border rounded px-4 fs-3"><c:out
							value="${edit_sale_note }"></c:out></textarea>
				</c:if>
			</div>
			<c:if test="${noteError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="offset-4 fs-3 fw-bold">備考は400字以内で入力してください。</div>
				</div>
			</c:if>
		</div>

		<div class="col-4 offset-5">
			<button type="submit" class="col-4 btn btn-primary border rounded">✔
				登 録</button>
			<a href="SalesDetail?id=${sale_num }" type="button"
				class="col-4 btn btn-white text-dark border rounded ml-4">キャンセル</a>
		</div>
	</form>
</div>
</body>
</html>