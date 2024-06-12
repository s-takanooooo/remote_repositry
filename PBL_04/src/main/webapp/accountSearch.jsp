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
            <div class="fs-2 fw-bold text-center">アカウント検索条件入力</div>
        </div>
    </div>
    
    <div class="d-flex flex-row mt-4">
		<!-- アクションの指定 -->
        <form class="col-12" method="post" action="AccountSearch">
            <div class="row col-12 my-4">
                <div class="col-2 text-end fs-3">氏名</div>
                <div class="col-2">
                    <div class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">部分一致</div>
                </div>
                <div class="col-8">
                    <input type="text" name="name" class="col-12 border rounded px-4 fs-3" placeholder="氏名">
                </div>
            </div>
            <div>
            <div class="row col-12 my-4">
                <div class="col-3 offset-1 text-center fs-3">メールアドレス</div>

                <div class="col-7">
                    <input type="email" name="mail" class="col-12 border rounded px-4 fs-3 text" placeholder="メールアドレス">
                </div>
            </div>
            </div>
            <div class="row col-12 my-4">
			<div class="col-3 text-end fs-3">権限</div>
			<div class="col-1">
				<div
					class="col-12 border rounded-pill text-white bg-secondary text-center fs-5">必須</div>
			</div>
			<div class="row col-8">
				<div class="col-3 offset-1 form-check">
					<input type="checkbox" class="form-check-input" name="salesPermission" value="1" id="salesRegister">
					<label class="fs-5" for="salesRegister">売上登録</label>
				</div>
				<div class="col-3">
					<input type="checkbox" class="form-check-input" name="accountsPermission" value="1"
						id="update"> <label class="fs-5" for="update">アカウント登録</label>
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