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
		<!-- permissionがnothingの場合 -->
		<c:if test="${permission == 0}">
			<div class="col-2">
				<input type="radio" class="" name="permission" id="nothing"
					value="0" checked> <label class="fs-4" for="nothing">権限なし</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="read" value="1"
					disabled> <label class="fs-4" for="read">売上登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="10" disabled> <label class="fs-4" for="update">アカウント登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="11" disabled> <label class="fs-4" for="update">売上登録/アカウント登録</label>
			</div>
		</c:if>
		<!-- permissionがreadの場合 -->
		<c:if test="${permission == 1}">
			<div class="col-2">
				<input type="radio" class="" name="permission" id="nothing"
					value="0" disabled> <label class="fs-4" for="nothing">権限なし</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="read" value="1"
					checked> <label class="fs-4" for="read">売上登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="10" disabled> <label class="fs-4" for="update">アカウント登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="11" disabled> <label class="fs-4" for="update">売上登録/アカウント登録</label>
			</div>
		</c:if>
		<!-- permissionがupdateの場合 -->
		<c:if test="${permission == 10}">
			<div class="col-2">
				<input type="radio" class="" name="permission" id="nothing"
					value="0" disabled> <label class="fs-4" for="nothing">権限なし</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="read" value="1"
					disabled> <label class="fs-4" for="read">売上登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="10" checked> <label class="fs-4" for="update">アカウント登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="11" disabled> <label class="fs-4" for="update">売上登録/アカウント登録</label>
			</div>
		</c:if>
		<c:if test="${permission == 11}">
			<div class="col-2">
				<input type="radio" class="" name="permission" id="nothing"
					value="0" disabled> <label class="fs-4" for="nothing">権限なし</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="read" value="1"
					disabled> <label class="fs-4" for="read">売上登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="10" disabled> <label class="fs-4" for="update">アカウント登録</label>
			</div>
			<div class="col-2">
				<input type="radio" class="" name="permission" id="update"
					value="11" checked> <label class="fs-4" for="update">売上登録/アカウント登録</label>
			</div>
		</c:if>
	</div>
</body>
</html>