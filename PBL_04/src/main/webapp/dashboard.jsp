<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ダッシュボード</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	type="text/css" />
</head>

<body>
	<!-- 	<div class="bg-light"> -->
	<!-- 		<div class="d-flex flex-row fs-5 py-4 align-items-center" -->
	<!-- 			style="height: 60px;"> -->
	<!-- 			<a href="#" -->
	<!-- 				class="col-3 text-secondary text-decoration-none text-nowrap"> -->
	<!-- 				物品売上管理システム </a> -->
	<!-- 			<div class="col-7 d-flex justify-content-between"> -->
	<!-- 				<a href="C0020.html" -->
	<!-- 					class="mx-2 text-secondary text-decoration-none text-nowrap">ダッシュボード</a> -->
	<!-- 				<a href="SalesRegister" -->
	<!-- 					class="mx-2 text-secondary text-decoration-none text-nowrap">売上登録</a> -->
	<!-- 				<a href="SalesSearch" -->
	<!-- 					class="mx-2 text-secondary text-decoration-none text-nowrap">売上検索</a> -->
	<!-- 				<a href="AccountRegister" -->
	<!-- 					class="mx-2 text-secondary text-decoration-none text-nowrap">アカウント登録</a> -->
	<!-- 				<a href="AccountSearch" -->
	<!-- 					class="mx-2 text-secondary text-decoration-none text-nowrap">アカウント検索</a> -->
	<!-- 			</div> -->
	<!-- 			<a href="Logout" -->
	<!-- 				class="col-2 text-center text-secondary text-decoration-none text-nowrap"> -->
	<!-- 				ログアウト </a> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<a class="navbar-brand text-secondary" href="#">物品売上管理システム</a>
					<a class="nav-link" href="C0020.html">ダッシュボード</a>
					<a class="nav-link" href="SalesRegister">売上登録</a>
					<a class="nav-link" href="SalesSearch">売上検索</a>
					<a class="nav-link" href="AccountRegister">アカウント登録</a>
					<a class="nav-link" href="AccountSearch">アカウント検索</a>

					<div class="position-absolute end-0">
						<a class="nav-link" href="Logout">ログアウト</a>
					</div>
			</div>

			</ul>
		</div>
		</div>
	</nav>


	<div>
		<c:if test="${accountAuthError == false}">
			<div
				class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
				role="alert">
				<div class="text-center fw-bold fs-3">このアカウントにはアカウント登録を行う権限がありません</div>
			</div>
		</c:if>
		<c:if test="${salesAuthError == false}">
			<div
				class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
				role="alert">
				<div class="text-center fw-bold fs-3">このアカウントには売上登録を行う権限がありません</div>
			</div>
		</c:if>
		<c:if test="${accountDeleteComplete == 'completed'}">
			<div
				class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
				role="alert">
				<div class="text-center fw-bold fs-3">アカウントの削除が完了しました</div>
			</div>
		</c:if>
		<c:if test="${accountRegisterComplete == 'completed'}">
			<div
				class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
				role="alert">
				<div class="text-center fw-bold fs-3">アカウント登録がが完了しました</div>
			</div>
		</c:if>
	</div>
</body>
</html>