<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>売上詳細表示</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
</head>

<jsp:include page="header.jsp" />
<div class="container-fluid">
	<div class="d-flex justify-content-start mx-4 mt-4">
		<h1 class="fw-bold">売上詳細表示</h1>
	</div>
	<div class="mt-2">
		<div class="d-flex justify-content-start ps-5 ms-5">
			<div class="d-flex justify-content-center ps-5 ms-5">
				<table class="table table-borderless">
					<tbody>
						<tr class="mb-3">
							<th class=" fs-3">販売日</th>
							<td class="fs-4"><c:out value="${sale.getSale_date() }" /></td>
						</tr>
						<tr>
							<th class=" fs-3">担当</th>
							<td class="fs-4"><c:out value="${sale.getName() }" /></td>
						</tr>
						<tr>
							<th class=" pe-5 fs-3">商品カテゴリー</th>
							<td class="fs-4"><c:out value="${sale.getCategory_name() }" /></td>
						</tr>
						<tr>
							<th class=" fs-3">商品名</th>
							<td class="fs-4"><c:out value="${sale.getTrade_name() }" /></td>
						</tr>
						<tr>
							<th class=" fs-3">単価</th>
							<td class="fs-4"><c:out value="${sale.getUnit_price() }" /></td>
						</tr>
						<tr>
							<th class=" fs-3">個数</th>
							<td class="fs-4"><c:out value="${sale.getSale_number() }" /></td>
						</tr>
						<tr>
							<th class=" fs-3">備考</th>
							<td class="fs-4"><c:out value="${sale.getNote()}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center pe-5 me-5">
		<div class="text align-self-start">
			<c:if test="${authority == 1 || authority == 11}">
				<a href="S0023?id=${sale_num }"
					class="btn btn-primary  px-4 me-3" role="button">✓編集</a>
				<a href="S0025?id=${sale_num }" class="btn btn-danger px-4 me-3"
					role="button">×削除</a>
			</c:if>
			<a class="btn btn-secondary px-4 me-3" href="S0021">キャンセル</a>
		</div> 
	</div>
</div>

<script src="../javascript/bootstrap.bundle.min.js"></script>
</body>

</html>