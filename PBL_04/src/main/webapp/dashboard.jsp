<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  type="text/css"/>
</head>

<body>
	<div class="bg-light">
		<div class="d-flex flex-row fs-5 py-4 align-items-center"
			style="height: 60px;">
			<a href="#"
				class="col-3 text-secondary text-decoration-none text-nowrap">
				物品売上管理システム </a>
			<div class="col-7 d-flex justify-content-between">
				<a href="Dashboard"
					class="mx-2 text-secondary text-decoration-none text-nowrap">ダッシュボード</a>
				<a href="SalesRegister"
					class="mx-2 text-secondary text-decoration-none text-nowrap">売上登録</a>
				<a href="SalesSearch"
					class="mx-2 text-secondary text-decoration-none text-nowrap">売上検索</a>
				<a href="AccountRegister"
					class="mx-2 text-secondary text-decoration-none text-nowrap">アカウント登録</a>
				<a href="AccountSearch"
					class="mx-2 text-secondary text-decoration-none text-nowrap">アカウント検索</a>
			</div>
			<a href="Logout"
				class="col-2 text-center text-secondary text-decoration-none text-nowrap">
				ログアウト </a>
		</div>
	</div>
	<div>
	<c:if test="${accountAuthError == false}">
		<div class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s" role="alert">
			<div class="text-center">このアカウントには権限がありません</div>
		</div>
	</c:if>
	<c:if test="${accountDeleteComplete == 'completed'}">
		<div class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s" role="alert">
			<div class="text-center">アカウントの削除が完了しました</div>
		</div>
	</c:if>
	<c:if test="${accountRegisterComplete == 'completed'}">
		<div class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s" role="alert">
			<div class="text-center">アカウント登録がが完了しました</div>
		</div>
	</c:if>
	</div>
</body>
</html>