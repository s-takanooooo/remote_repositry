<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>アカウント検索条件入力</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>

<jsp:include page="header.jsp" />

<div class="">
	<div class="col-8 offset-2">
		<div class="fs-1 fw-bold">アカウント検索条件入力</div>
	</div>
</div>
<c:if test="${format == false}">
	<div
		class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
		role="alert">
		<div class="text-center fw-bold fs-3">メールアドレスは正しい形式で入力してください</div>
	</div>
</c:if>

<div class="d-flex flex-row mt-4">
	<!-- アクションの指定 -->
	<form class="col-12" method="post" action="S0040">
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
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">名前は20字以内で入力してください</div>
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
					<div class="invalid-feedback" role="alert">
						<div class="fw-bold fs-3 offset-4">メールアドレスは100字以内で入力してください</div>
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
						name="salesAuthority" value="1" id="salesRegister"> <label
						class="fs-5" for="salesRegister">売上登録</label>
				</div>
				<div class="col-4">
					<input type="checkbox" class="form-check-input"
						name="accountsAuthority" value="1" id="accountsRegister">
					<label class="fs-5" for="accountsRegister">アカウント登録</label>
				</div>
				<div class="col-4">
					<input type="checkbox" class="form-check-input"
						name="allAuthority" value="100" id="allAuthority" checked>
					<label class="fs-5" for="allAuthority">条件なし</label>
				</div>
			</div>
		</div>
		<div class="col-8 offset-4">
			<button type="submit" class="col-3 btn btn-primary border rounded">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path
						d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
</svg>
				検索
			</button>
			<a href="S0040" class="btn btn-secondary col-3 offset-1">クリア</a>
		</div>
	</form>
</div>
<div></div>
<script src="js/checkbox.js"></script>
</body>
</html>