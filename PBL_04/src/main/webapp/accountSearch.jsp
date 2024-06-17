<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="">
	<div class="col-8 offset-2">
		<div class="fs-2 fw-bold text-center">アカウント検索条件入力</div>
	</div>
</div>

<div class="d-flex flex-row mt-4">
	<!-- アクションの指定 -->
	<form class="col-12" method="post" action="AccountSearch">
		<div class="row col-12 my-4">
			<div class="row col-4">
				<div class="col-7 text-end fs-3">氏名</div>
				<div class="col-5">
					<div
						class="border rounded-pill text-white bg-secondary text-center fs-5">部分一致</div>
				</div>
			</div>
			<div class="col-7 form-floating is-invalid">
				<input type="text" name="name"
					class="col-12 border rounded px-4 fs-3" placeholder="氏名">
			</div>
			<c:if test="${accountNameError == false}">
				<div class="invalid-feedback col-4 offset-4" role="alert">
					<div>名前は20字以内で入力してください</div>
				</div>
			</c:if>
		</div>
		<div>
			<div class="row col-12 my-4">
				<div class="row col-4">
					<div class="text-end fs-3">メールアドレス</div>
				</div>

				<div class="col-7 form-floating is-invalid">
					<input type="email" name="mail"
						class="col-12 border rounded px-4 fs-3 text" placeholder="メールアドレス">
				</div>
				<c:if test="${accountMailError == false}">
					<div class="invalid-feedback col-4 offset-4" role="alert">
						<div>メールアドレスは100字以内で入力してください</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="row col-12 my-4">
			<div class="row col-4">
				<div class="text-end fs-3">権限</div>
			</div>
			<div class="row col-7">
				<div class="col-3 offset-1 form-check">
					<input type="checkbox" class="form-check-input"
						name="salesPermission" value="1" id="salesRegister"> <label
						class="fs-5" for="salesRegister">売上登録</label>
				</div>
				<div class="col-4">
					<input type="checkbox" class="form-check-input"
						name="accountsPermission" value="1" id="accountsRegister">
					<label class="fs-5" for="accountsRegister">アカウント登録</label>
				</div>
				<div class="col-4">
					<input type="checkbox" class="form-check-input"
						name="allPermission" value="1" id="allPermission" checked>
					<label class="fs-5" for="allPermission">条件なし</label>
				</div>
			</div>
		</div>
		<div class="col-4 offset-4">
			<button type="submit" class="col-5 btn btn-primary border rounded">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
</svg>　検索</button>
			<a href="AccountSearch" class="btn btn-white border rounded col-5">クリア</a>
		</div>
	</form>
</div>
<div></div>
<script src="js/checkbox.js"></script>
</body>
</html>