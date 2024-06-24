<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/current.css" type="text/css">
</head>
<body>
	<div style="white-space: nowrap;">
		<table class="table">
			<tbody class="p-0 col-12">
			<tr>
				<!-- <nav class="navbar navbar-expand-md bg-body-tertiary p-0"> -->
<!-- 					<div class="container-fluid p-0">
 -->					<td class="col-2">
						<div class="fs-3 p-2">物品売上管理システム</div>
						</td>
						<!-- <button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button> -->
								<td class="p-0 col-1 ${current == 'active1' ? 'current' : ''}" align="center" valign="middle">
									<a class=" fs-5  ${current == 'active1' ? 'current' : ''}" href="C0020">ダッシュボード</a>
								</td>
								<td class="p-0 col-1" align="center" valign="middle">
									<a class=" fs-5  ${current == 'active2' ? 'current' : ''}" href="S0010">売上登録</a>
								</td>
								<td class="p-0 col-1 ${current == 'active3' ? 'current' : ''}" align="center" valign="middle">
									<a class=" fs-5 ${current == 'active3' ? 'current' : ''}" href="S0020">売上検索</a>
								</td>
								<td class="p-0 col-1" align="center" valign="middle">
									<a class=" fs-5  ${current == 'active4' ? 'current' : ''} " href="S0030">アカウント登録</a>
								</td>
								<td class=" p-0 col-1" align="center" valign="middle">
									<a class=" fs-5 ${current == 'active5' ? 'current' : ''} " href="S0040">アカウント検索</a>
								</td>
								<td class="col-4"></td>
							<td class="p-0" align="center" valign="middle">
							<div class=" ms-auto">
								<a class=" fs-5" href="C0011">ログアウト</a>
							</div>
							</td>
					<!-- </div> -->
				<!-- </nav> -->
			</tr>
			</tbody>
		</table>

	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>