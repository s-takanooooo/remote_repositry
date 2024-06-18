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
	
		<div class="col-8 offset-2">
			<div class="fs-2 fw-bold">アカウント詳細削除確認</div>
		</div>
	
	<div class="d-flex flex-row mt-4">
		<form class="col-12" method="post" action="S0044">
		<input type="hidden" value="${deleteAccountId}" name="deleteAccountId"> 
			<div class="row col-12 my-4">
				<div class="col-4 text-end fs-3">氏名</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deleteName"
						value="${deleteName}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-4 text-end fs-3">メールアドレス</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deleteMail"
						value="${deleteMail}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-4 text-end fs-3">パスワード</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deletePass"
						value="${deletePass}" readonly>
				</div>
			</div>
			<div class="row col-12 my-4">
				<div class="col-4 text-end fs-3">パスワード（確認）</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3" name="deletePassConfirm"
						value="${deletePass}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-4 text-end fs-3">権限</div>
				<!-- permissionがnothingの場合 -->
				<jsp:include page="authorityButton.jsp"></jsp:include>
			</div>
			<div class="col-4 offset-4">
				<button type="submit" class="col-5 btn btn-danger border rounded">✖
					O K</button>
				<a href="AccountSearchSession" class="btn btn-secondary col-5">キャンセル</a>
			</div>
		</form>
	</div>
	<div></div>
</body>
</html>