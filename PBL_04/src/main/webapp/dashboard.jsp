<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>ダッシュボード</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/current.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	type="text/css" />
<link rel="stylesheet" href="css/font.css">

</head>

<body>
	<div style="white-space: nowrap;">
		<table class="table">
			<td class="p-0">
				<nav class="navbar navbar-expand-md bg-body-tertiary p-0">
					<div class="container-fluid p-0">
						<div class="navbar-brand fs-3 p-2 me-5">物品売上管理システム</div>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse p-0"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li
									class="nav-item mx-2 p-3 ${current == 'active1' ? 'current' : ''}  ">
									<a class="nav-link fs-5" href="C0020">ダッシュボード</a>
								</li>
								<li class="nav-item mx-2 p-3"><a class="nav-link fs-5"
									href="S0010">売上登録</a></li>
								<li class="nav-item mx-2 p-3"><a class="nav-link fs-5"
									href="S0020">売上検索</a></li>
								<li class="nav-item mx-2 p-3"><a class="nav-link fs-5"
									href="S0030">アカウント登録</a></li>
								<li class="nav-item mx-2 p-3"><a class="nav-link fs-5"
									href="S0040">アカウント検索</a></li>
							</ul>
							<div class="nav-item ms-auto me-4 ">
								<a class="nav-link fs-5" href="C0011">ログアウト</a>
							</div>
						</div>
					</div>
				</nav>
			</td>
		</table>
	</div>
	<div>
		<c:if test="${accountAuthError == false}">
			<div
				class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
				role="alert">
				<div class="fw-bold fs-5">このアカウントにはアカウント登録を行う権限がありません</div>
			</div>
		</c:if>
		<c:if test="${salesAuthError == false}">
			<div
				class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
				role="alert">
				<div class="fw-bold fs-5">このアカウントには売上登録を行う権限がありません</div>
			</div>
		</c:if>
	</div>
	<div class="d-flex flex-row">
		<div class="d-flex col-6 align-items-center flex-column">
			<div class="text-end">
				<div class="fs-1 text-center">今期売上実績</div>
				<div class="fs-2">
					<c:out value="${sales2024}" />
					円
				</div>
			</div>
			<div class="text-end mt-5">
				<div class="fs-1">前期売上実績</div>
				<div class="fs-2">
					<c:out value="${sales2023}" />
					円
				</div>
			</div>
			<div class="text-end mt-5">
				<div class="fs-1 text-center">今期売上目標</div>
				<div class="fs-2">
					<c:out value="${salesGoal}" />
					円
				</div>
			</div>
			<div class="text-end mt-5">
				<div class="fs-1 text-center">売上目標達成率</div>
				<div class="fs-2">
					<c:out value="${salesPer}" />
					%
				</div>
			</div>
		</div>
		<div class="d-flex col-6 align-items-center flex-column">
			<div class="fs-1 text-center">カテゴリ集計</div>
			<div class="col-10">
				<div id="chart"></div>
			</div>
		</div>
	</div>


	<canvas></canvas>

	<!-- サーブレットからのデータをJavaScriptに渡すためのhidden要素 -->
	<input type="hidden" id="categories"
		value='<%=request.getAttribute("categories")%>' />
	<input type="hidden" id="values"
		value='<%=request.getAttribute("values")%>' />
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- jQueryの読み込み -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- ApexChartsの読み込み -->
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<!-- 外部JavaScriptファイルの読み込み -->
	<script src="js/chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.0/p5.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.0/addons/p5.dom.min.js"></script>
	<script src="js/bankcy.js" defer></script>
</body>

</html>