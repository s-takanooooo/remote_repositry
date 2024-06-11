<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>売上詳細表示｜物品売り上げ管理システム</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>

<jsp:include page="header.jsp"/>
    <div class="container-fluid">
        <div class="d-flex justify-content-start mx-4 mt-4">
            <h1 class="fw-bold">売上詳細表示</h1>
        </div>
        <div class="row mt-2">
            <div class="d-flex justify-content-start ps-5 ms-5">
                <div class="d-flex justify-content-center ps-5 ms-5">
                    <table class="table table-borderless">
                        <tbody>
                            <tr class="mb-3">
                                <th class="fw-bold pe-5">販売日</th>
                                <td>2024/06/10</td>
                            </tr>
                            <tr>
                                <th class="fw-bold">担当</th>
                                <td>松岡修造</td>
                            </tr>
                            <tr>
                                <th class="fw-bold pe-5">商品カテゴリー</th>
                                <td>食料品</td>
                            </tr>
                            <tr>
                                <th class="fw-bold">商品名</th>
                                <td>リンゴ</td>
                            </tr>
                            <tr>
                                <th class="fw-bold">商品カテゴリー</th>
                                <td>食料品</td>
                            </tr>
                            <tr>
                                <th class="fw-bold">単価</th>
                                <td>30</td>
                            </tr>
                            <tr>
                                <th class="fw-bold">個数</th>
                                <td>1000</td>
                            </tr>
                            <tr>
                                <th class="fw-bold">備考</th>
                                <td>今日からの新商品</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center pe-5 me-5">
            <div class="text align-self-start">
                <button class="btn btn-primary  me-3" role="button">✓編集</button>
                <button class="btn btn-danger  me-3" role="button">×削除</button>
                <a class="btn btn-light" href="SalesDetail">キャンセル</a>
            </div>
        </div>
    </div>

    <script src="../javascript/bootstrap.bundle.min.js"></script>
</body>

</html>