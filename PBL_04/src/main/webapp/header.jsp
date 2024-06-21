<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/current.css" type="text/css">
</head>
<div style="white-space: nowrap;">
	<nav class="navbar navbar-expand-md bg-body-tertiary p-0">
		<div class="container-fluid p-0">
			<div class="navbar-brand fs-3 p-2">物品売上管理システム</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse p-0" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li
						class="nav-item mx-2 p-3 ${current == 'active1' ? 'current' : ''}  ">
						<a class="nav-link fs-5" href="C0020">ダッシュボード</a>
					</li>
					<li
						class="nav-item mx-2 p-3 ${current == 'active2' ? 'current' : ''}">
						<a class="nav-link fs-5" href="S0010">売上登録</a>
					</li>
					<li
						class="nav-item mx-2 p-3 ${current == 'active3' ? 'current' : ''}">
						<a class="nav-link fs-5" href="S0020">売上検索</a>
					</li>
					<li
						class="nav-item mx-2 p-3 ${current == 'active4' ? 'current' : ''}">
						<a class="nav-link fs-5" href="S0030">アカウント登録</a>
					</li>
					<li
						class="nav-item mx-2 p-3 ${current == 'active5' ? 'current' : ''}">
						<a class="nav-link fs-5" href="S0040">アカウント検索</a>
					</li>
				</ul>
				<div class="nav-item ms-auto me-4 ">
					<a class="nav-link fs-5" href="C0011">ログアウト</a>
				</div>
			</div>
		</div>
	</nav>
</div>
<script src="js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</html>