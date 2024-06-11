<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>アカウント検索結果表示｜物品売り上げ管理システム</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>

<jsp:include page="header.jsp" />
    <div class="container-fluid">
        <div class="d-flex justify-content-start">
            <h1 class="fw-bold mt-5">アカウント検索結果表示</h1>
        </div>
        <div class="row">
            <div class="d-flex justify-content-center">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">操作</th>
                            <th scope="col">No</th>
                            <th scope="col">氏名</th>
                            <th scope="col">メールアドレス</th>
                            <th scope="col">権限</th>
                        </tr>
                    </thead>
                    <c:forEach var="item" items="${search}">
                        <tbody>
                            <tr>
                                <td><button class="btn btn-primary  me-3" role="button">✓編集</button>
                                    <button class="btn btn-danger  me-3" role="button">×削除</button>
                                </td>
                                <td>${item.account_id}</td>
                                <td>${item.name}</td>
                                <td>${item.mail}</td>
                                <td>${item.authority}</td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <script src="../javascript/bootstrap.bundle.min.js"></script>
</body>

</html>
<!-- a -->