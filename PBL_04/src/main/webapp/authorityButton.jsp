<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row col-8">
		<!-- 権限無しの場合 -->
		<c:if test="${permission == '0'}">

			<div class="col-3 offset-1 form-check">
				<input type="checkbox" class="form-check-input"
					name="salesPermission" value="1" id="salesRegister" disabled> <label
					class="fs-5" for="salesRegister">売上登録</label>
			</div>
			<div class="col-3">
				<input type="checkbox" class="form-check-input"
					name="accountsPermission" value="1" id="update" disabled> <label
					class="fs-5" for="update">アカウント登録</label>
			</div>

		</c:if>
		<!-- 売上登録のみの場合 -->
		<c:if test="${permission == '1'}">
			<div class="col-3 offset-1 form-check">
				<input type="checkbox" class="form-check-input"
					name="salesPermission" value="1" id="salesRegister" checked disabled> <label
					class="fs-5" for="salesRegister">売上登録</label>
			</div>
			<div class="col-3">
				<input type="checkbox" class="form-check-input"
					name="accountsPermission" value="1" id="update" disabled> <label
					class="fs-5" for="update">アカウント登録</label>
			</div>
		</c:if>
		<!-- アカウント登録のみの場合 -->
		<c:if test="${permission == '10'}">
			<div class="col-3 offset-1 form-check">
				<input type="checkbox" class="form-check-input"
					name="salesPermission" value="1" id="salesRegister" disabled> <label
					class="fs-5" for="salesRegister">売上登録</label>
			</div>
			<div class="col-3">
				<input type="checkbox" class="form-check-input"
					name="accountsPermission" value="1" id="update" checked disabled> <label
					class="fs-5" for="update">アカウント登録</label>
			</div>
		</c:if>
		<!-- 全権限の場合 -->
		<c:if test="${permission == '11'}">
			<div class="col-3 offset-1 form-check">
				<input type="checkbox" class="form-check-input"
					name="salesPermission" value="1" id="salesRegister" checked disabled> <label
					class="fs-5" for="salesRegister">売上登録</label>
			</div>
			<div class="col-3">
				<input type="checkbox" class="form-check-input"
					name="accountsPermission" value="1" id="update" checked disabled> <label
					class="fs-5" for="update">アカウント登録</label>
			</div>
		</c:if>
	</div>
</body>
</html>