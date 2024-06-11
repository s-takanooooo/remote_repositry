<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<title>アカウント登録確認</title>
</head>
<body>
<jsp:include page="header.jsp" />
	
		<div class="col-8 offset-2">
			<div class="fs-2 fw-bold text-center">アカウント登録してよろしですか？</div>
		</div>
	
	<!-- placeholderにサーブレットから値を持ってくる -->
	<div class="d-flex flex-row mt-4">
		<form class="col-12" method="post" action="AccountRegisterConfirm">
			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">氏名</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="name" value="${name}"
						placeholder="${name}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">メールアドレス</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="mail" value="${mail}"
						placeholder="${mail}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">パスワード</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="pass" value="${pass}"
						placeholder="${pass}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">パスワード（確認）</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="passConfirm" value="${passConfirm}"
						placeholder="${passConfirm}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">権限</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="row col-8">
					<!-- permissionがnothingの場合 -->
					<c:if test="${permission == 0}">
						<div class="col-2">
							<input type="radio" class="" name="permission" id="nothing" value="0"
								checked> <label class="fs-4" for="nothing">権限なし</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="read" value="1" disabled>
							<label class="fs-4" for="read">売上登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="10"
								disabled> <label class="fs-4" for="update">アカウント登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="11"
								disabled> <label class="fs-4" for="update">売上登録/アカウント登録</label>
						</div>
					</c:if>
					<!-- permissionがreadの場合 -->
					<c:if test="${permission == 1}">
						<div class="col-2">
							<input type="radio" class="" name="permission" id="nothing" value="0"
								disabled> <label class="fs-4" for="nothing">権限なし</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="read" value="1" checked>
							<label class="fs-4" for="read">売上登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="10"
								disabled> <label class="fs-4" for="update">アカウント登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="11"
								disabled> <label class="fs-4" for="update">売上登録/アカウント登録</label>
						</div>
					</c:if>
					<!-- permissionがupdateの場合 -->
					<c:if test="${permission == 10}">
						<div class="col-2">
							<input type="radio" class="" name="permission" id="nothing" value="0"
								disabled> <label class="fs-4" for="nothing">権限なし</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="read" value="1" disabled>
							<label class="fs-4" for="read">売上登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="10"
								checked> <label class="fs-4" for="update">アカウント登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="11"
								disabled> <label class="fs-4" for="update">売上登録/アカウント登録</label>
						</div>
					</c:if>
					<c:if test="${permission == 11}">
						<div class="col-2">
							<input type="radio" class="" name="permission" id="nothing" value="0"
								disabled> <label class="fs-4" for="nothing">権限なし</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="read" value="1" disabled>
							<label class="fs-4" for="read">売上登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="10"
								disabled> <label class="fs-4" for="update">アカウント登録</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update" value="11"
								checked> <label class="fs-4" for="update">売上登録/アカウント登録</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-8 offset-4">
				<button type="submit" class="col-3 btn btn-primary border rounded">ok</button>
				<a href="AccountRegister" class="btn btn-secondary col-3 offset-1">キャンセル</a>
			</div>
		</form>
	</div>
	<div></div>
</body>
</html>