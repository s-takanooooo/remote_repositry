<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<script>
		const links = jQuery(".navbar-nav > a");
		links.each(function() {
			if (this.href === location.href) {
				jQuery(this).closest(".nav-link").addClass("current");
			}
		});
	</script>
	<nav class="navbar navbar-expand-sm bg-body-tertiary">
		<div class="container-fluid p-2">
			<a class="navbar-brand fs-3" href="#">物品売り上げ管理システム</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item mx-3"><a class="nav-link fs-5"
						href="C0020">ダッシュボード</a></li>
					<li class="nav-item mx-3"><a class="nav-link fs-5  ${current == 'active' ? 'current' : ''}"
						href="S0010">売上登録</a></li>
					<li class="nav-item mx-3"><a class="nav-link fs-5  ${current == 'active' ? 'current' : ''}"
						href="S0020">売上検索</a></li>
					<li class="nav-item mx-3"><a class="nav-link fs-5  ${current == 'active' ? 'current' : ''}"
						href="S0030">アカウント登録</a></li>
					<li class="nav-item mx-3"><a class="nav-link fs-5  ${current == 'active' ? 'current' : ''}"
						href="S0040">アカウント検索</a></li>
				</ul>
				<div class="nav-item ms-auto me-4">
					<a class="nav-link fs-5" href="Logout">ログアウト</a>
				</div>
			</div>
		</div>
	</nav>
	<div></div>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>