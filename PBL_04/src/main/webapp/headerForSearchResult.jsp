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
		<table class="table table-light">
			<tbody class="p-0 col-12">
			<tr>
					<td class="col-2">
						<div class="fs-3 py-2">物品売上管理システム</div>
						</td>
								<td class="p-2 col-1 ${current == 'active1' ? 'current' : ''}" align="center" valign="middle">
									<a class="link-underline link-underline-opacity-0 fs-5  ${current == 'active1' ? 'current' : ''}" href="C0020">ダッシュボード</a>
								</td>
								<td class="p-2 col-1 ${current == 'active2' ? 'current' : ''}" align="center" valign="middle">
									<a class="link-underline link-underline-opacity-0 fs-5  ${current == 'active2' ? 'current' : ''}" href="S0010">売上登録</a>
								</td>
								<td class="p-2 col-1 ${current == 'active3' ? 'current' : ''}" align="center" valign="middle">
									<a class="link-underline link-underline-opacity-0 fs-5 ${current == 'active3' ? 'current' : ''}" href="S0020">売上検索</a>
								</td>
								<td class="p-2 col-1 ${current == 'active4' ? 'current' : ''}" align="center" valign="middle">
									<a class="link-underline link-underline-opacity-0 fs-5  ${current == 'active4' ? 'current' : ''} " href="S0030">アカウント登録</a>
								</td>
								<td class=" p-2 col-1 ${current == 'active5' ? 'current' : ''}" align="center" valign="middle">
									<a class="link-underline link-underline-opacity-0 fs-5 ${current == 'active5' ? 'current' : ''} " href="S0040">アカウント検索</a>
								</td>
								<td class="col-5"></td>
							<td class="p-2 col-1" align="center" valign="middle">
							<div class=>
								<a class="link-underline link-underline-opacity-0 fs-5" id="logout" href="C0011">ログアウト</a>
							</div>
							</td>
			</tr>
			</tbody>
		</table>

	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>