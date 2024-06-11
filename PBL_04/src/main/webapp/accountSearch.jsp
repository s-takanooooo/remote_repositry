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
    
    <div class="">
        <div class="col-8 offset-2">
            <div class="fs-1 fw-bold">アカウント検索条件入力</div>
        </div>
    </div>
    
    <div class=" mt-4">
		<!-- アクションの指定 -->
        <form method="post" action="AccountSearch">
            <div class="row offset-2 col-8 my-4">
                <div class="col-2 text-end fs-3">氏名</div>
                <div class="col-2">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">部分一致</div>
                </div>
                <div class="col-8">
                    <input type="text" name="name" class="col-12 border rounded px-4 fs-3" placeholder="氏名">
                </div>
            </div>
            <div>
            <div class="row offset-2 col-8 my-4">
                <div class="col-4 text-end fs-3 text-center">メールアドレス</div>

                <div class="col-8">
                    <input type="email" name="mail" class="col-12 border rounded px-4 fs-3 text" placeholder="メールアドレス">
                </div>
            </div>
            </div>
            <div class="row offset-2 col-8 my-4">
                <div class="col-4 text-end fs-3 text-center">権限</div>
                
                <div class="row col-8">
                    <div class="col-2">
                        <input type="radio" class="" name="permission" id="nothing" value="0">
                        <label class="fs-4" for="nothing">権限なし</label>
                 	</div>
                    <div class="col-2">
                    	<input type="radio" class="" name="permission" id="read" value="1">
                    	<label class="fs-4" for="read">売上登録</label>
                	</div>
                    <div class="col-2">
                    	<input type="radio" class="" name="permission" id="update" value="10">
                    	<label class="fs-4" for="update">アカウント登録</label>
                	</div>
                    <div class="col-2">
                    	<input type="radio" class="" name="permission" id="update" value="11">
                    	<label class="fs-4" for="update">売上登録/アカウント登録</label>
                	</div>
                </div>
            </div>
            <div class="col-2 offset-5">
                <button type="submit" class="col-5 btn btn-primary border rounded">検　索</button>
                <a href="AccountSearch" class="btn btn-white border rounded col-5">クリア</a>
            </div>
        </form>
    </div>
    <div>
    </div>
</body>
</html>