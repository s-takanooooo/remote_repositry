<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	type="text/css" />


<title>アカウント詳細編集</title>
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->

<div class="col-8 offset-2">
	<div class="fs-2 fw-bold text-center">アカウント詳細編集</div>
</div>
<c:if test="${same == false}">
	<div
		class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
		role="alert">
		<div class="text-center fw-bold fs-3">入力されたパスワードが一致しておりません</div>
	</div>
</c:if>
<div class="d-flex flex-row mt-4">
	<form class="col-10 offset-1" method="post" action="S0042">
		<c:if test="${getSession == 0}">
			<input type="hidden" value="${editAccountId}" name="accountId">
		</c:if>
		<c:if test="${getSession == 1}">
			<input type="hidden" value="${editAccountIdSession}" name="accountId">
		</c:if>

		<div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">氏名</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-8 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="text" class="col-12 border rounded px-4 fs-3"
						name="name" value="${editName}"  required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="text" class="col-12 border rounded px-4 fs-3"
						name="name" value="${editNameSession}"  required>
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
			<div class="col-8 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="email" class="col-12 border rounded px-4 fs-3"
						name="mail" value="${editMail}"  required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="email" class="col-12 border rounded px-4 fs-3"
						name="mail" value="${editMailSession}"  required>
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
			<div class="col-8 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="password" class="col-12 border rounded px-4 fs-3"
						name="pass" value="${editPass}"  required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="password" class="col-12 border rounded px-4 fs-3"
						name="pass" value="${editPassSession}"  required>
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

		<div class="row col-12">
			<div class="col-3 text-end text-nowrap fs-3">パスワード（確認）</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="col-8 form-floating is-invalid">
				<c:if test="${getSession == 0}">
					<input type="password" class="col-12 border rounded px-4 fs-3"
						name="passConfirm" value="${editPass}"  required>
				</c:if>
				<c:if test="${getSession == 1}">
					<input type="password" class="col-12 border rounded px-4 fs-3"
						name="passConfirm" value="${editPassSession}"  required>
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
					<c:if test="${editAuth == 0}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister"> <label
								class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update"> <label
								class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<c:if test="${editAuth == 1}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister" checked>
							<label class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update"> <label
								class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<c:if test="${editAuth == 10}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister"> <label
								class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update" checked>
							<label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<c:if test="${editAuth == 11}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister" checked>
							<label class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update" checked>
							<label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
				</c:if>
				<c:if test="${getSession == 1}">
					<c:if test="${editAuthoritySession == '0'}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister"> <label
								class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update"> <label
								class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<c:if test="${editAuthoritySession == '1'}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister" checked>
							<label class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update"> <label
								class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<c:if test="${editAuthoritySession == '10'}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister"> <label
								class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update" checked>
							<label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<c:if test="${editAuthoritySession == '11'}">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								name="salesAuthority" value="1" id="salesRegister" checked>
							<label class="fs-5" for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input"
								name="accountsAuthority" value="1" id="update" checked>
							<label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
		<div class="col-8 offset-4">
			<button type="submit" class="col-3 btn btn-primary border rounded">✔
				更 新</button>
			<a href="S0046?notCompleted=1" class="btn btn-secondary col-3 offset-1">キャンセル</a>
		</div>
	</form>
</div>
</body>

</html>