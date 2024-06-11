<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/day.js"></script>
</head>

<jsp:include page="header.jsp" />
    <!-- 本体 -->
    
    
        <div class="col-8 offset-2">
            <div class="fs-2 fw-bold text-center">売上検索条件入力</div>
        </div>
    
    
    <div class="d-flex flex-row mt-4">
		<!-- アクションの指定 -->
        <form class="col-12" method="post" action="SalesSearch">
            <div class="row col-12 my-4">
                
                <div class="col-3 offset-1 text-end fs-3">販売日</div>
                <div class="col-3">
                    <input type="date" name="startDate" id="datepicker" value="" class="col-12 border rounded px-4 fs-3" required>
                </div>
                <div class="col-1 text-center fs-2">~</div>
                <div class="col-3">
                    <input type="date" name="endDate" id="datepicker" value="" class="col-12 border rounded px-4 fs-3" required>
                </div>
                
            </div>


            <div class="row col-12 my-4">
                <div class="col-3 offset-1 text-end fs-3">担当</div>
                
                <select class="col-7 border rounded px-4 fs-3">
                    <option selected>選択してください</option>
                    <option value="1">花本</option>
                    <option value="2">鷹野</option>
                    <option value="3">大石</option>
                    <option value="4">原</option>
                </select>
            </div>

            <div class="row col-12 my-4">
                <div class="col-3 text-end fs-3">商品カテゴリー</div>
                <div class="col-1">
                    <div class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
                </div>
                <select class="col-8 border rounded px-4 fs-3">
                    <option selected>選択してください</option>
                    <option value="1">商品1</option>
                    <option value="2">商品2</option>
                    <option value="3">商品3</option>
                    <option value="4">商品4</option>
                </select>
            </div>
            
            <div class="row col-12 my-4">
                <div class="col-2 text-end fs-3">商品名</div>
                <div class="col-2">
                    <div class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">部分一致</div>
                </div>
                <div class="col-8">
                    <input type="text" name="mail" class="col-12 border rounded px-4 fs-3" placeholder="商品名" required>
                </div>
            </div>
            <div>
            <div class="row col-12 my-4">
                <div class="col-2 text-end fs-3">備考</div>
                <div class="col-2">
                    <div class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">部分一致</div>
                </div>

                <div class="col-8">
                    <input type="text" name="mail" class="col-12 border rounded px-4 fs-3" placeholder="備考" required>
                </div>
            </div>
            </div>

            <div class="col-2 offset-5">
                <button type="submit" class="col-5 btn btn-primary border rounded">検　索</button>
                <a href="SalesSearch" class="btn btn-white border rounded col-5">クリア</a>
            </div>
        </form>
    </div>
    <div>
    </div>
</body>
</html>