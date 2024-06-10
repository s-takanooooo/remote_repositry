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

<body>
    <!-- ヘッダーをここに追加 -->
    <div>
        header
    </div>
    <!-- 本体 -->
    <div class="row">
        <div class="col-8 offset-2">
            <div class="fs-1 fw-bold">売上登録確認</div>
        </div>
    </div>
    <div class="row mt-4">
		<!-- アクションの指定 -->
        <form method="post" action="#">
            <div class="row offset-2 col-8 my-4">
                
                <div class="col-3 text-end fs-3">販売日</div>
                <div class="col-3">
                    <input type="date" name="name" id="datepicker" value="" class="col-12 border rounded px-4 fs-3" readonly>
                </div>
            </div>


            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">担当</div>
                <select class="col-8 border rounded px-4 fs-3">
                    <option selected>イチロー</option>
                    
                </select>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">商品カテゴリー</div>
                <select class="col-8 border rounded px-4 fs-3">
                    <option selected>食料品</option>
                    
                </select>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">商品名</div>
                <div class="col-8">
                    <input type="text" name="mail" class="col-12 border rounded px-4 fs-3" value="からあげ弁当" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">単価</div>
                <div class="col-3">
                    <input type="text" name="mail" class="col-12 border rounded px-4 fs-3" value="540" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">個数</div>
                <div class="col-3">
                    <input type="text" name="mail" class="col-12 border rounded px-4 fs-3" value="3" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">小計</div>
                <div class="col-3">
                    <input type="text" name="mail" class="col-12 border rounded px-4 fs-3" value="1620" readonly>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">備考</div>

                <div class="col-8">
                    <textarea name="mail" rows="4" class="col-12 border rounded px-4 fs-3" value="備考" readonly></textarea>
                </div>
            </div>

            
            <div class="col-2 offset-5">
                <table>
                <tr><button type="submit" class="col-6 btn btn-primary border rounded">✔　登　録</button></tr>
                <tr><a href="" class="col-6 btn btn-primary border rounded">キャンセル</a></tr>
        </table>
            </div>

        </form>
    </div>
    <div>
    </div>
</body>

</html>