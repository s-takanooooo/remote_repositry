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
	<!-- ヘッダーをここに追加 -->
	<div>header</div>
	<!-- 本体 -->
	<div class="row">
		<div class="col-8 offset-2">
			<div class="fs-1 fw-bold">アカウント登録してよろしですか？</div>
		</div>
	</div>
	<!-- placeholderにサーブレットから値を持ってくる -->
	<div class="row mt-4">
		<form method="post" action="#">
			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">氏名</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3"
						placeholder="${name}" readonly>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">メールアドレス</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3"
						placeholder="${mail}" readonly>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">パスワード</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3"
						placeholder="${pass}" readonly>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">パスワード（確認）</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3"
						placeholder="${pass_confirm}" readonly>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">権限</div>
				<div class="col-1">
					<div
						class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
				</div>
				<div class="row col-8">
					<!-- permissionがnothingの場合 -->
					<c:if test="${permission == 'nothing'}">
						<div class="col-2">
							<input type="radio" class="" name="permission" id="nothing"
								checked> <label class="fs-4" for="nothing">権限なし</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="read" disabled>
							<label class="fs-4" for="read">参照</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update"
								disabled> <label class="fs-4" for="update">更新</label>
						</div>
					</c:if>
					<!-- permissionがreadの場合 -->
					<c:if test="${permission == 'read'}">
						<div class="col-2">
							<input type="radio" class="" name="permission" id="nothing"
								disabled> <label class="fs-4" for="nothing">権限なし</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="read" checked>
							<label class="fs-4" for="read">参照</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update"
								disabled> <label class="fs-4" for="update">更新</label>
						</div>
					</c:if>
					<!-- permissionがupdateの場合 -->
					<c:if test="${permission == 'update'}">
						<div class="col-2">
							<input type="radio" class="" name="permission" id="nothing"
								disabled> <label class="fs-4" for="nothing">権限なし</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="read" disabled>
							<label class="fs-4" for="read">参照</label>
						</div>
						<div class="col-2">
							<input type="radio" class="" name="permission" id="update"
								checked> <label class="fs-4" for="update">更新</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-2 offset-5">
				<button type="submit" class="col-4 btn btn-primary border rounded">ok</button>
				<a href="#" class="btn btn-secondary col-4">キャンセル</a>
			</div>
		</form>
	</div>
	<div></div>
</body>
</html>