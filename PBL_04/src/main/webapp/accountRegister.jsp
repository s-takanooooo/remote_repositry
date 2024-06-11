<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<title>アカウント登録</title>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

	<div class="col-8 offset-2">
		<div class="fs-2 fw-bold text-center">アカウント登録</div>
	</div>

<div class="d-flex flex-row mt-4">
	<!-- アクションの指定 -->
	<c:if test="${same == false}">
	<div class="alert alert-danger" role="alert">
		<div>入力されたパスワードが一致しておりません</div>
	</div>
	</c:if>
	<form class="col-12" method="post" action="AccountRegister">
		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">氏名</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<input type="text" name="name"
					class="col-12 border rounded px-4 fs-3" placeholder="氏名" required>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">メールアドレス</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<input type="email" name="mail"
					class="col-12 border rounded px-4 fs-3" placeholder="メールアドレス"
					required>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">パスワード</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<input type="password" name="pass"
					class="col-12 border rounded px-4 fs-3" placeholder="パスワード"
					required>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">パスワード（確認）</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7">
				<input type="password" name="passConfirm"
					class="col-12 border rounded px-4 fs-3" placeholder="パスワード（確認）"
					required>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">権限</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="row col-8">
				<div class="col-2">
					<input type="radio" class="" name="permission" value="0"
						id="nothing"> <label class="fs-5" for="nothing">権限なし</label>
				</div>
				<div class="col-3">
					<input type="radio" class="" name="permission" value="1"
						id="read"> <label class="fs-5" for="read">売上登録</label>
				</div>
				<div class="col-3">
					<input type="radio" class="" name="permission" value="10"
						id="update"> <label class="fs-5" for="update">アカウント登録</label>
				</div>
				<div class="col-4">
					<input type="radio" class="" name="permission" value="11"
						id="update"> <label class="fs-5" for="update">売上登録/アカウント登録</label>
				</div>
			</div>
		</div>
		<div class="col-8 offset-4">
			<button type="submit" class="col-3 offset-2 btn btn-primary border rounded">✔
				登 録</button>
		</div>
	</form>
</div>
<div></div>
</body>

</html>