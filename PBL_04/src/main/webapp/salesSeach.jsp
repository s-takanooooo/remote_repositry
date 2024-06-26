<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>売上検索条件入力</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>

<jsp:include page="header.jsp" />
<!-- 本体 -->


<div class="container-fluid">
	<div class="row">
		<div class="col-8 offset-2">
			<div class="fs-1 fw-bold">売上検索条件入力</div>
		</div>
	</div>
	<div class="d-flex flex-row mt-4">
		<!-- アクションの指定 -->
		<form class="col-12" method="post" action="S0021">
			<div class="row my-4">

				<div class="col-2 offset-1 text-end fs-3">販売日</div>
				<div class="col-3 offset-1">
					<input type="date" name="startDate" value=""
						class="col-12 border rounded px-4 fs-3">
				</div>
				<div class="col-1 text-center fs-2">~</div>
				<div class="col-3">
					<input type="date" name="endDate" id="datepicker" value=""
						class="col-12 border rounded px-4 fs-3">
				</div>

			</div>


			<div class="row my-4">
				<div class="col-2 offset-1 text-end fs-3">担当</div>
				<div class="col-7 offset-1">
					<select class="w-100 border rounded px-4 fs-3 form-select"
						name="staff">
						<option selected value="0">選択してください</option>
						<c:forEach var="staff_name" items="${staff}">
							<option value="${staff_name}">${staff_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row my-4">
				<div class="col-3 text-end fs-3">商品カテゴリー</div>

				<div class="col-7 offset-1">
					<select class="w-100 border rounded px-4 fs-3 form-select"
						name="category">
						<option selected value="0">選択してください</option>
						<c:forEach var="category_name" items="${category}">
							<option value="${category_name}">${category_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row my-4">
				<div class="d-flex flex-row col-4">
					<div class="col-6 text-end fs-3">商品名</div>

					<div class="col-6">
						<div
							class="col-8 offset-2 border rounded-pill text-white bg-secondary text-center fs-5">部分一致
						</div>
					</div>
				</div>
				<div class="col-7">
					<input type="text" name="mail"
						class="col-12 border rounded px-4 fs-3" placeholder="商品名">
				</div>
			</div>
			<div>
				<div class="row my-4">
					<div class="d-flex flex-row col-4">
						<div class="col-6 text-end fs-3">備考</div>
						<div class="col-6">
							<div
								class="col-8 offset-2 border rounded-pill text-white bg-secondary text-center fs-5">
								部分一致</div>
						</div>
					</div>
					<div class="col-7">
						<textarea name="note" class="col-12 border rounded px-4 fs-3"
							placeholder="備考"></textarea>
					</div>
				</div>
			</div>

			<div class="col-8 offset-4">
				<button type="submit"  class="col-3 btn btn-primary border rounded">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                    </svg>
					検 索
				</button>
				<a href="S0020" class="btn btn-secondary col-3 offset-1">クリア</a>
			</div>
		</form>
	</div>
</div>
<script src="js/day.js"></script>
</body>

</html>