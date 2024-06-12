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

<div class="col-8 offset-2">
	<div class="fs-2 fw-bold text-center">アカウント詳細編集</div>
</div>
<div class="d-flex flex-row mt-4">
	<form class="col-10 offset-1" method="post" action="AccountEdit">

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">氏名</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-8">
				<input type="text" class="col-12 border rounded px-4 fs-3" name="name"
					value="${selectById.name}" required>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">メールアドレス</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-8">
				<input type="text" class="col-12 border rounded px-4 fs-3" name="mail"
					value="${selectById.mail}" required>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">パスワード</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-8">
				<input type="password" class="col-12 border rounded px-4 fs-3" name="pass"
					value="${selectById.password}" required>
			</div>
		</div>

		<div class="row col-12">
			<div class="col-3 text-end fs-3">パスワード（確認）</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-8">
				<input type="password" class="col-12 border rounded px-4 fs-3" name="passConfirm"
					value="${selectById.password}" required>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">権限</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="row col-8">
				<!-- permissionがnothingの時 -->
				<c:if test="${selectById.authority == '0'}">
					<div class="col-2">
						<input type="radio" class="" name="permission" id="nothing"
							checked> <label class="fs-4" for="nothing">権限なし</label>
					</div>
					<div class="col-3">
						<input type="radio" class="" name="permission" id="read">
						<label class="fs-4" for="read">売上登録</label>
					</div>
					<div class="col-3">
						<input type="radio" class="" name="permission" id="update">
						<label class="fs-4" for="update">アカウント登録</label>
					</div>
					<div class="col-4">
						<input type="radio" class="" name="permission" id="update">
						<label class="fs-4" for="update">売上登録/アカウント登録</label>
					</div>
					<!-- permissionがreadの時 -->

				</c:if>
				<c:if test="${selectById.authority == '1'}">
					<div class="col-2">
						<input type="radio" class="" name="permission" id="nothing">
						<label class="fs-4" for="nothing">権限なし</label>
					</div>
					<div class="col-3">
						<input type="radio" class="" name="permission" id="read" checked>
						<label class="fs-4" for="read">売上登録</label>
					</div>
					<div class="col-3">
						<input type="radio" class="" name="permission" id="update">
						<label class="fs-4" for="update">アカウント登録</label>
					</div>
					<div class="col-4">
						<input type="radio" class="" name="permission" id="update">
						<label class="fs-4" for="update">売上登録/アカウント登録</label>
					</div>
				</c:if>
				<!-- permissionがupdateの時 -->
				<c:if test="${selectById.authority == '10'}">
					<div class="col-2">
						<input type="radio" class="" name="permission" id="nothing">
						<label class="fs-4" for="nothing">権限なし</label>
					</div>
					<div class="col-2">
						<input type="radio" class="" name="permission" id="read">
						<label class="fs-4" for="read">売上登録</label>
					</div>
					<div class="col-2">
						<input type="radio" class="" name="permission" id="update" checked>
						<label class="fs-4" for="update">アカウント登録</label>
					</div>
					<div class="col-2">
						<input type="radio" class="" name="permission" id="update">
						<label class="fs-4" for="update">売上登録/アカウント登録</label>
					</div>
				</c:if>
				<c:if test="${selectById.authority == '11'}">
					<div class="col-2">
						<input type="radio" class="" name="permission" id="nothing">
						<label class="fs-4" for="nothing">権限なし</label>
					</div>
					<div class="col-2">
						<input type="radio" class="" name="permission" id="read">
						<label class="fs-4" for="read">売上登録</label>
					</div>
					<div class="col-2">
						<input type="radio" class="" name="permission" id="update">
						<label class="fs-4" for="update">アカウント登録</label>
					</div>
					<div class="col-2">
						<input type="radio" class="" name="permission" id="update" checked>
						<label class="fs-4" for="update">売上登録/アカウント登録</label>
					</div>
				</c:if>
			</div>
		</div>
		<div class="col-8 offset-4">
			<button type="submit" class="col-4 btn btn-primary border rounded">✔
				更 新</button>
			<a href="AccountEdit" class="btn btn-secondary col-4">キャンセル</a>
		</div>
	</form>
</div>
<div></div>
</body>

</html>