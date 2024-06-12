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
	<div class="fs-2 fw-bold text-center">アカウント詳細編集確認</div>
</div>

<div class="d-flex flex-row mt-4">
	<form class="col-10 offset-1" method="post" action="AccountEditConfirm">
	<input type="hidden" value="${accountId}" name="accountId">

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">氏名</div>
			<div class="col-8">
				<input type="text" class="col-12 border rounded px-4 fs-3"
					value="${name}" name="name" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">メールアドレス</div>
			<div class="col-8">
				<input type="text" class="col-12 border rounded px-4 fs-3"
					value="${mail}" name="mail" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">パスワード</div>
			<div class="col-8">
				<input type="text" class="col-12 border rounded px-4 fs-3"
					value="${pass}" name="pass" readonly>
			</div>
		</div>
		
		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">パスワード（確認）</div>
			<div class="col-8">
				<input type="text" class="col-12 border rounded px-4 fs-3" name="passConfirm"
					value="${pass}" name="passConfirm" readonly>
			</div>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">権限</div>
			<jsp:include page="authorityButton.jsp"></jsp:include>
		</div>
		<div class="col-8 offset-4">
			<button type="submit" class="col-4 btn btn-primary border rounded">ok</button>
			<a href="AccountEdit" class="btn btn-secondary col-4">キャンセル</a>
		</div>
	</form>
</div>
<div></div>
</body>
</html>