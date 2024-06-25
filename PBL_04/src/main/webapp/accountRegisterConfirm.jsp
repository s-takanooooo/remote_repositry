<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
        type="text/css" />
<title>アカウント登録確認</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="col-8 offset-2">
		<div class="fs-2 fw-bold text-center">アカウント登録してよろしいですか？</div>
	</div>
	<c:if test="${already == false}">
		<div
			class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
			role="alert">
			<div class="text-center fw-bold fs-3">このメールアドレスは使用できません</div>
		</div>
	</c:if>
	<c:if test="${format == false}">
		<div
			class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
			role="alert">
			<div class="text-center fw-bold fs-3">メールアドレスを正しい形式で入力して下さい</div>
		</div>
	</c:if>

	<!-- placeholderにサーブレットから値を持ってくる -->
	<div class="d-flex flex-row mt-4">
		<form class="col-12" method="post" action="S0031">
			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">氏名</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
						name="name" value="${registerName}" placeholder="${registerName}"
						readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">メールアドレス</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
						name="mail" value="${registerMail}" placeholder="${registerMail}"
						readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">パスワード</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
						name="pass" value="${registerPass}" placeholder="${registerPass}"
						readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3 text-nowrap">パスワード（確認）</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="col-7">
					<input type="text" class="col-12 border rounded px-4 fs-3 bg-body-secondary"
						name="passConfirm" value="${registerPassConfirm}"
						placeholder="${registerPassConfirm}" readonly>
				</div>
			</div>

			<div class="row col-12 my-4">
				<div class="col-3 text-end fs-3">権限</div>
				<div class="col-1">
					<div
						class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
				</div>
				<div class="row col-8">
					<!-- 権限無しの場合 -->
					<c:if test="${registerAuthority == '0'}">
						<input type="hidden" name="authority"
							value="${ registerAuthority }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								id="salesRegister" disabled> <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update"
								disabled> <label class="fs-5" for="update">アカウント登録</label>
						</div>

					</c:if>
					<!-- 売上登録のみの場合 -->
					<c:if test="${registerAuthority == '1'}">
						<input type="hidden" name="authority"
							value="${ registerAuthority }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								id="salesRegister" checked disabled> <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update"
								disabled> <label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<!-- アカウント登録のみの場合 -->
					<c:if test="${registerAuthority == '10'}">
						<input type="hidden" name="authority"
							value="${ registerAuthority }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								id="salesRegister" disabled> <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update"
								checked disabled> <label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
					<!-- 全権限の場合 -->
					<c:if test="${registerAuthority == '11'}">
						<input type="hidden" name="authority"
							value="${ registerAuthority }">
						<div class="col-3 offset-1 form-check">
							<input type="checkbox" class="form-check-input"
								id="salesRegister" checked disabled> <label class="fs-5"
								for="salesRegister">売上登録</label>
						</div>
						<div class="col-4">
							<input type="checkbox" class="form-check-input" id="update"
								checked disabled> <label class="fs-5" for="update">アカウント登録</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-8 offset-4">
				<button type="submit" class="col-3 btn btn-primary border rounded">ok</button>
				<a href="S0032"
					class="btn btn-secondary col-3 offset-1">キャンセル</a>
			</div>
		</form>
	</div>
	<div></div>
</body>
</html>