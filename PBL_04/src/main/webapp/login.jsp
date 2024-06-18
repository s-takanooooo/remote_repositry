<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css" type="text/css" />
</head>

<body>
	<div class="mx-auto p-2" style="width: 350px;">
		<div class="text-center">
			<section>
				<h3>物品売上管理システム</h3>
			</section>
			<c:if test="${login == false}">
			<div class="alert alert-danger" role="alert">
				<div class="text-center fw-bold fs-3">入力内容に誤りがあります</div>
			</div>
			</c:if>
			<div class="main">
				<form action="C0010" method="post">
					<div class="login-box">
						<input class="form-control" type="email" name="email"
							placeholder="メールアドレス" /> <input class="form-control"
							type="password" name="pass" placeholder="パスワード" />
						<button class="mt-3 btn btn-primary" type="submit">ログイン</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>