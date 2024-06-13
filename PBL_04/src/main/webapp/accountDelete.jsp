<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<title>アカウント削除</title>
</head>

<jsp:include page="header.jsp"/>
	<!-- 本体 -->
	<div class="row">
		<div class="col-8 offset-2">
			<div class="fs-1 fw-bold">アカウント詳細削除確認</div>
		</div>
	</div>
	<div class="row mt-4">
		<form method="post" action="AccountDelete">
		<input type="hidden" value="${deleteAccountId}" name="deleteAccountId"> 
			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">氏名</div>
				<div class="col-1"></div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deleteName"
						value="${deleteName}" readonly>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">メールアドレス</div>
				<div class="col-1"></div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deleteMail"
						value="${deleteMail}" readonly>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">パスワード</div>
				<div class="col-1"></div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deletePass"
						value="${deletePass}" readonly>
				</div>
			</div>
			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">パスワード（確認）</div>
				<div class="col-1"></div>
				<div class="col-8">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deletePassConfirm"
						value="${deletePass}" readonly>
				</div>
			</div>

			<div class="row offset-2 col-8 my-4">
				<div class="col-3 text-end fs-3">権限</div>
				<div class="col-1"></div>
				<!-- permissionがnothingの場合 -->
				<jsp:include page="authorityButton.jsp"></jsp:include>
			</div>
			<div class="col-2 offset-5">
				<button type="submit" class="col-5 btn btn-danger border rounded">✖
					O K</button>
				<a href="AccountSearchSession" class="btn btn-secondary col-5">キャンセル</a>
			</div>
		</form>
	</div>
	<div></div>
</body>
</html>