<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>アカウント検索結果表示</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	type="text/css" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="css/font.css"> 
</head>

<jsp:include page="headerForSearchResult.jsp" />
<div class="container-fluid">
	<c:if test="${completed == 'S0042'}">
		<div
			class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
			role="alert">
			<div class="fw-bold fs-5">アカウント編集が完了しました</div>
		</div>
	</c:if>

	<c:if test="${completed == 'S0044'}">
		<div
			class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
			role="alert">
			<div class="fw-bold fs-5">アカウントの削除が完了しました</div>
		</div>
	</c:if>
	<div class="row">
		<div class="d-flex justify-content-start" style="white-space: nowrap;">
			<div class="col-8 offset-2">
			<h1 class="fw-bold mt-5">アカウント検索結果表示</h1>
				<table class="table" id="accountTable">
					<thead>
						<tr>
							<c:if test="${authority == 10 || authority == 11}">
								<th scope="col">操作</th>
							</c:if>
							<th scope="col">No</th>
							<th scope="col">氏名</th>
							<th scope="col">メールアドレス</th>
							<th scope="col">権限</th>
						</tr>
					</thead>
					<c:forEach var="item" items="${search}">
						<tbody>
							<tr>
								<c:if test="${authority == 10 || authority == 11}">
									<td><a class="btn btn-primary  me-3" role="button"
										href="S0042?accountId=${item.account_id}">✓編集</a> <a
										class="btn btn-danger  me-3" role="button"
										href="S0044?accountId=${item.account_id}">×削除</a></td>
								</c:if>
								<td><c:out value="${item.account_id}"></c:out></td>
								<td><c:out value="${item.name}"></c:out></td>
								<td><c:out value="${item.mail}"></c:out></td>
								<c:if test="${item.authority == 0}">
									<td>権限なし</td>
								</c:if>
								<c:if test="${item.authority == 1}">
									<td>売上登録</td>
								</c:if>
								<c:if test="${item.authority == 10}">
									<td>アカウント登録</td>
								</c:if>
								<c:if test="${item.authority == 11}">
									<td>売上登録/アカウント登録</td>
								</c:if>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
		<div class="offset-4">
			<a href="AccountSearchCsv" type="butoon" class="btn btn-success col-3">結果をダウンロード</a>
		</div>
	</div>
	</div>
</div>
<script src="../javascript/bootstrap.bundle.min.js"></script>
<script>
	const ref = document.referrer
</script>
<script lang="javascript" src="https://cdn.sheetjs.com/xlsx-0.20.2/package/dist/xlsx.full.min.js"></script>

</body>

</html>
