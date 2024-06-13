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
                                <td><a class="btn btn-primary  me-3" role="button" href="AccountEdit?accountId=${item.account_id}">✓編集</a>
                                    <a class="btn btn-danger  me-3" role="button" href="AccountDelete?accountId=${item.account_id}">×削除</a>
                                </td>
                                <td>${item.account_id}</td>
                                <td>${item.name}</td>
                                <td>${item.mail}</td>
                                <c:if test="${item.authority == 0}">
                                	<td>権限なし</td>                                
                                </c:if>
                                <c:if test="${item.authority == 1}">
                                	<td>売上登録</td>                                
                                </c:if>
                                <c:if test="${item.authority == 10}">
                                	<td>アカウント登録</td>                                
                                </c:if>
                                <c:if test="${item.authority == 11}">
                                	<td>売上登録/アカウント登録</td>                                
                                </c:if>
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
