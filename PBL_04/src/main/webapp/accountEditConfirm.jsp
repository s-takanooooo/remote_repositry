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
<title>アカウント詳細編集確認</title>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-2">
	<div class="fs-2 fw-bold text-center">アカウント詳細編集確認</div>
</div>
	<c:if test="${already == false}">
		<div
			class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
			role="alert">
			<div class="text-center fw-bold fs-3">このメールアドレスは使用できません</div>
		</div>
	</c:if>
	<c:if test="${format == false}">
		<div
			class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
			role="alert">
			<div class="text-center fw-bold fs-3">メールアドレスは正しい形式で入力してください</div>
		</div>
	</c:if>
<div class="d-flex flex-row mt-4">
	<form class="col-12" method="post" action="S0043">
		<input type="hidden" value="${editAccountIdSession}" name="accountId">

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">氏名</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${editNameSession}" name="name" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">メールアドレス</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${editMailSession}" name="mail" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">パスワード</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					value="${editPassSession}" name="pass" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end text-nowrap fs-3">パスワード（確認）</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
					name="passConfirm" value="${editPassConfirmSession}"
					name="passConfirm" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">権限</div>
			<div class="row col-8">
				<!-- 権限無しの場合 -->
				<c:if test="${editAuthoritySession == '0'}">
					<input type="hidden" name="authority"
						value="${ editAuthoritySession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-5">
						<input type="checkbox" class="form-check-input" id="update"
							disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>

				</c:if>
				<!-- 売上登録のみの場合 -->
				<c:if test="${editAuthoritySession == '1'}">
					<input type="hidden" name="authority"
						value="${ editAuthoritySession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							checked disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-5">
						<input type="checkbox" class="form-check-input" id="update"
							disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>
				</c:if>
				<!-- アカウント登録のみの場合 -->
				<c:if test="${editAuthoritySession == '10'}">
					<input type="hidden" name="authority"
						value="${ editAuthoritySession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-5">
						<input type="checkbox" class="form-check-input" id="update"
							checked disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>
				</c:if>
				<!-- 全権限の場合 -->
				<c:if test="${editAuthoritySession == '11'}">
					<input type="hidden" name="authority"
						value="${ editAuthoritySession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							checked disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-5">
						<input type="checkbox" class="form-check-input" id="update"
							checked disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>
				</c:if>
			</div>
		</div>

		<div class="col-8 offset-4">
			<button type="submit" class="col-3 btn btn-primary border rounded">o
				k</button>
			<a href="S0045"
				class="col-3 offset-1 btn btn-secondary">キャンセル</a>
		</div>
	</form>
</div>
<div></div>
</body>
</html>