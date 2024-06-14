<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/day.js"></script>
</head>

<jsp:include page="header.jsp" />
    <!-- 本体 -->
    <div class="row">
        <div class="col-8 offset-2">
            <div class="fs-1 fw-bold">売上詳細編集</div>
        </div>
    </div>
    <div class="row mt-4">
        <!-- アクションの指定 -->
        <form method="post" action="SalesEdit?id=${sessionScope.sale.getSale_id() }" id="form">
            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">販売日</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <input type="date" name="day" id="datepicker" class="col-12 border rounded px-4 fs-3" value=""
                        required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">担当</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <select name="staff" class="col-12 border rounded px-4 fs-3 form-select" required>
                        <option selected>選択してください</option>
				<!-- itemsに配列を格納　value=配列の値が入る変数-->
				<c:forEach var="staff_name" items="${staff}">
					<option value="${staff_name}">${staff_name}</option>
				</c:forEach>
                    </select>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">商品カテゴリー</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <select name="category" class="col-12 border rounded px-4 fs-3 form-select" required>
                        <option selected>選択してください</option>
				<!-- itemsに配列を格納　value=配列の値が入る変数-->
				<c:forEach var="category_name" items="${category}">
					<option value="${category_name}">${category_name}</option>
				</c:forEach>
                    </select>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">商品名</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <input type="text" name="product_name" class="col-12 border rounded px-4 fs-3" placeholder="商品名" required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">単価</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-4">
                    <input type="text" name="price" class="col-12 border rounded px-4 fs-3" placeholder="単価" required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">個数</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-4">
                    <input type="text" name="product_num" class="col-12 border rounded px-4 fs-3" placeholder="個数" required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="offset-3 col-1">
                    <div class="col-10  text-dark  text-center fs-3">備考</div>
                </div>
                <div class="col-8">
                    <textarea name="mail" rows="4" class="col-12 border rounded px-4 fs-3" placeholder="備考"></textarea>
                </div>
            </div>

            <div class="col-4 offset-5">
                <button type="submit" class="col-4 btn btn-primary border rounded">✔　登　録</button>
                <a href="SalesDetail?id=${sessionScope.sale_num }" type="button" class="col-4 btn btn-white text-dark border rounded ml-4">キャンセル</a>
            </div>
        </form>
    </div>
    <div>
    </div>
</body>
</html>