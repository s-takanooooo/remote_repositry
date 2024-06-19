<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>アカウント登録</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	type="text/css" />
<title>アカウント登録</title>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-2">
	<div class="fs-1 fw-bold">アカウント登録</div>
</div>

<c:if test="${same == false}">
	<div
		class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
		role="alert">
		<div class="text-center fw-bold fs-3">入力されたパスワードが一致しておりません</div>
	</div>
</c:if>

<div class="d-flex flex-row mt-4">
	<!-- アクションの指定 -->
	<form class="col-12" method="post" action="S0030">
		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">氏名</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="text" name="name"
						class="col-12 border rounded px-4 fs-3" placeholder="氏名" required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="text" name="name"
						class="col-12 border rounded px-4 fs-3" value="${registerName}" required>
				</c:if>
			</div>
			<c:if test="${accountNameError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">名前は20字以内で入力してください</div>
				</div>
			</c:if>
			<c:if test="${fillAccountName == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">名前を入力してください</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">メールアドレス</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="email" name="mail"
						class="col-12 border rounded px-4 fs-3" placeholder="メールアドレス" required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="email" name="mail"
						class="col-12 border rounded px-4 fs-3" value="${registerMail}" required>
				</c:if>

			</div>
			<c:if test="${accountMailError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">メールアドレスは100字以内で入力してください</div>
				</div>
			</c:if>
			<c:if test="${fillAccountMail == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">メールアドレスを入力してください</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">パスワード</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="password" name="pass"
						class="col-12 border rounded px-4 fs-3" placeholder="パスワード" required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="password" name="pass"
						class="col-12 border rounded px-4 fs-3" value="${registerPass}" required>
				</c:if>
			</div>
			<c:if test="${accountPassError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">パスワードは30字以内で入力してください</div>
				</div>
			</c:if>
			<c:if test="${fillAcountPass == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">パスワードを入力してください</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">パスワード（確認）</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-7 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="password" name="passConfirm"
						class="col-12 border rounded px-4 fs-3" placeholder="パスワード（確認）" required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="password" name="passConfirm"
						class="col-12 border rounded px-4 fs-3"
						value="${registerPassConfirm}" required>
				</c:if>
			</div>
			<c:if test="${accountPassError == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">パスワードは30字以内で入力してください</div>
				</div>
			</c:if>
			<c:if test="${fillAccountPassConfirm == false}">
				<div class="invalid-feedback" role="alert">
					<div class="fw-bold fs-3 offset-4">確認用のパスワードを入力してください</div>
				</div>
			</c:if>
		</div>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">権限</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="row col-8">
				<c:if test="${getSession == 0}">
					<div class="col-3 offset-1 form-check">
						<input type="checkbox" class="form-check-input"
							name="salesPermission" value="1" id="salesRegister"> <label
							class="fs-5" for="salesRegister">売上登録</label>
					</div>
					<div class="col-4">
						<input type="checkbox" class="form-check-input"
							name="accountsPermission" value="1" id="update"> <label
							class="fs-5 text-nowrap" for="update">アカウント登録</label>
					</div>
				</c:if>
				<c:if test="${getSession == 1}">
					<c:if test="${registerPermission == '0'}">
						<input type="hidden" name="permission" value="${ registerPermission }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input" name="salesPermission" value="1"
								id="salesRegister"  > <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update" name="accountsPermission" value="1"
								 > <label class="fs-5" for="update">アカウント登録</label>
						</div>

					</c:if>
					<!-- 売上登録のみの場合 -->
					<c:if test="${registerPermission == '1'}">
						<input type="hidden" name="permission" value="${ registerPermission }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input" name="salesPermission" value="1"
								id="salesRegister" checked> <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update"  name="accountsPermission" value="1"
								> <label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<!-- アカウント登録のみの場合 -->
					<c:if test="${registerPermission == '10'}">
						<input type="hidden" name="permission" value="${ registerPermission }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"  name="salesPermission" value="1"
								id="salesRegister"> <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update"  name="accountsPermission" value="1"
								checked > <label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<!-- 全権限の場合 -->
					<c:if test="${registerPermission == '11'}">
						<input type="hidden" name="permission" value="${ registerPermission }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"  name="salesPermission" value="1"
								id="salesRegister" checked> <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update"  name="accountsPermission" value="1"
								checked > <label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
		<div class="col-2 offset-5">
			<button type="submit" class="col-6 btn btn-primary border rounded">✔
				登 録</button>
		</div>
	</form>
</div>

</body>

</html>