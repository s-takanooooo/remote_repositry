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
            <div class="fs-1 fw-bold">売上編集</div>
        </div>
    </div>
    <div class="row mt-4">
        <!-- アクションの指定 -->
        <form method="post" action="SalesEdit" id="form">
            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">販売日</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <input type="date" name="day" id="datepicker" class="col-12 px-4 fs-3" value=""
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
                        <option selected value="山田太郎">山田太郎</option>
                        <option selected value="花本">花本</option>
                        <option value="鷹野">鷹野</option>
                        <option value="原">原</option>
                        <option value="大石">大石</option>
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
                        <option selected value="食料品">食料品</option>
                        <option value="日用品">日用品</option>
                        <option value="家電製品">家電製品</option>
                        <option value="衣服">衣服</option>
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
                    <input type="text" name="product_name" class="col-12 border rounded px-4 fs-3" placeholder="個数" required>
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
                <a href="SalesEdit" type="button" class="col-4 btn btn-white text-dark border rounded ml-4">キャンセル</a>
            </div>
        </form>
    </div>
    <div>
    </div>
</body>
</html>