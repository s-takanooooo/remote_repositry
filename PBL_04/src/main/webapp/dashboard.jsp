<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
<title>ダッシュボード</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
        type="text/css" />
</head>

<body>
        <script>
        const links = jQuery(".navbar-nav > a");
        links.each(function () {
            if (this.href === location.href) {
            jQuery(this).closest(".nav-link").addClass("current");
                }
            });
        </script> 
    <nav class="navbar navbar-expand-sm bg-body-tertiary">
        <div class="container-fluid p-2">
            <a class="navbar-brand fs-3" href="#">物品売り上げ管理システム</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item mx-3">
                        <a class="nav-link fs-5" href="C0020">ダッシュボード</a>
                    </li>
                    <li class="nav-item mx-3">
                        <a class="nav-link fs-5" href="S0010">売上登録</a>
                    </li>
                    <li class="nav-item mx-3">
                        <a class="nav-link fs-5" href="S0020">売上検索</a>
                    </li>
                    <li class="nav-item mx-3">
                        <a class="nav-link fs-5" href="S0030">アカウント登録</a>
                    </li>
                    <li class="nav-item mx-3">
                        <a class="nav-link fs-5" href="S0040">アカウント検索</a>
                    </li>
                </ul>
                <div class="nav-item ms-auto me-4">
                    <a class="nav-link fs-5" href="Logout">ログアウト</a>
                </div>
            </div>
        </div>
    </nav>
    <div>

    </div>
    <div>
                <c:if test="${accountAuthError == false}">
                    <div class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
                        role="alert">
                        <div class="text-center fw-bold fs-3">このアカウントにはアカウント登録を行う権限がありません</div>
                    </div>
                </c:if>
                <c:if test="${salesAuthError == false}">
                    <div class="alert alert-danger col-12 animate__animated animate__fadeOut animate__delay-2s"
                        role="alert">
                        <div class="text-center fw-bold fs-3">このアカウントには売上登録を行う権限がありません</div>
                    </div>
                </c:if>
                <c:if test="${accountDeleteComplete == 'completed'}">
                    <div class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
                        role="alert">
                        <div class="text-center fw-bold fs-3">アカウントの削除が完了しました</div>
                    </div>
                </c:if>
                <c:if test="${accountRegisterComplete == 'completed'}">
                    <div class="alert alert-primary col-12 animate__animated animate__fadeOut animate__delay-2s"
                        role="alert">
                        <div class="text-center fw-bold fs-3">アカウント登録がが完了しました</div>
                    </div>
                </c:if>
            </div>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>

</html>