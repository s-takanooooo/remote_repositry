<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<title>アカウント詳細編集確認</title>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-2">
	<div class="fs-2 fw-bold text-center">アカウント詳細編集確認</div>
</div>

<div class="d-flex flex-row mt-4">
	<form class="col-12" method="post" action="AccountEditConfirm">
		<input type="hidden" value="${editAccountIdSession}" name="accountId">

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">氏名</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3"
					value="${editNameSession}" name="name" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">メールアドレス</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3"
					value="${editMailSession}" name="mail" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">パスワード</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3"
					value="${editPassSession}" name="pass" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end text-nowrap fs-3">パスワード（確認）</div>
			<div class="col-7">
				<input type="text" class="col-12 border rounded px-4 fs-3"
					name="passConfirm" value="${editPassConfirmSession}"
					name="passConfirm" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-4 text-end fs-3">権限</div>
			<div class="row col-8">
				<!-- 権限無しの場合 -->
				<c:if test="${editPermissionSession == '0'}">
					<input type="hidden" name="permission"
						value="${ editPermissionSession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-4">
						<input type="checkbox" class="form-check-input" id="update"
							disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>

				</c:if>
				<!-- 売上登録のみの場合 -->
				<c:if test="${editPermissionSession == '1'}">
					<input type="hidden" name="permission"
						value="${ editPermissionSession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							checked disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-4">
						<input type="checkbox" class="form-check-input" id="update"
							disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>
				</c:if>
				<!-- アカウント登録のみの場合 -->
				<c:if test="${editPermissionSession == '10'}">
					<input type="hidden" name="permission"
						value="${ editPermissionSession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-4">
						<input type="checkbox" class="form-check-input" id="update"
							checked disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>
				</c:if>
				<!-- 全権限の場合 -->
				<c:if test="${editPermissionSession == '11'}">
					<input type="hidden" name="permission"
						value="${ editPermissionSession }">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input" id="salesRegister"
							checked disabled> <label class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-4">
						<input type="checkbox" class="form-check-input" id="update"
							checked disabled> <label class="fs-5" for="update">アカウント登録</label>
					</div>
				</c:if>
			</div>
		</div>

		<div class="col-8 offset-4">
			<button type="submit" class="col-4 btn btn-primary border rounded">o
				k</button>
			<a href="AccountEditSession"
				class="col-4 btn btn-secondary">キャンセル</a>
		</div>
	</form>
</div>
<div></div>
</body>
</html>