<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>

<body>
<div class="bg-light">
    <div class="d-flex flex-row fs-5 py-4 align-items-center" style="height: 60px;">
        <a href="#" class="col-3 text-secondary text-decoration-none text-nowrap">
            物品売上管理システム
        </a>
        <div class="col-7 d-flex justify-content-between">
            <a href="C0020" class="mx-2 text-secondary text-decoration-none text-nowrap">ダッシュボード</a>
            <a href="SalesRegister" class="mx-2 text-secondary text-decoration-none text-nowrap">売上登録</a>
            <a href="S0020" class="mx-2 text-secondary text-decoration-none text-nowrap">売上検索</a>
            <a href="S0030" class="mx-2 text-secondary text-decoration-none text-nowrap">アカウント登録</a>
            <a href="S0040" class="mx-2 text-secondary text-decoration-none text-nowrap">アカウント検索</a>
        </div>
        <a href="Logout" class="col-2 text-center text-secondary text-decoration-none text-nowrap">
            ログアウト
        </a>
    </div>
</div>
</body>
</html>
