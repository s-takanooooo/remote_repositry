<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>

<body>
    <!-- ヘッダーをここに追加 -->
    <div>
        header
    </div>
    <!-- 本体 -->
    <div class="row">
        <div class="col-8 offset-2">
            <div class="fs-1 fw-bold">売上編集</div>
        </div>
    </div>
    <div class="row mt-4">
        <!-- アクションの指定 -->
        <form method="post" action="#">
            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">販売日</div>
                <div class="col-8 offset-1">
                    <input type="date" name="day" id="datepicker" class="col-12 px-4 fs-3" value=""
                    readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">担当</div>
                <div class="col-8 offset-1">
                    <select name="staff" class="col-12 border rounded px-4 fs-3 form-select" readonly>
                        <option selected value="花本">花本</option>
                    </select>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">商品カテゴリー</div>
                <div class="col-8 offset-1">
                    <select name="staff" class="col-12 border rounded px-4 fs-3 form-select" readonly>
                        <option selected value="食料品">食料品</option>
                    </select>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">商品名</div>
                <div class="col-8 offset-1">
                    <input type="text" name="product_name" class="col-12 border rounded px-4 fs-3" value="商品名" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">単価</div>
                <div class="col-4 offset-1">
                    <input type="text" name="price" class="col-12 border rounded px-4 fs-3" value="単価" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">個数</div>
                <div class="col-4 offset-1">
                    <input type="text" name="product_name" class="col-12 border rounded px-4 fs-3" value="個数" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">小計</div>
                <div class="col-4 offset-1">
                    <input type="text" name="product_name" class="col-12 border rounded px-4 fs-3" value="小計" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3   text-dark  text-end fs-3">備考</div>
                <div class="col-8 offset-1">
                    <textarea name="mail" rows="4" class="col-12 border rounded px-4 fs-3" value="備考" readonly></textarea>
                </div>
            </div>

            <div class="col-4 offset-5">
                <button type="submit" class="col-4 btn btn-danger border rounded">✔　O　K</Kbd></button>
                <a href="#" type="button" class="col-4 btn btn-white text-dark border rounded ml-4">キャンセル</a>
            </div>
        </form>
    </div>
    <div>
    </div>
</body>

</html>