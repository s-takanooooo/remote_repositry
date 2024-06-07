<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>

<body>
    <!-- ヘッダーをここに追加 -->
    <div>
        header
    </div>
    <!-- 本体 -->
    <div class="row">
        <div class="col-8 offset-2">
            <div class="fs-1 fw-bold">アカウント登録</div>
        </div>
    </div>
    <div class="row mt-4">
		<!-- アクションの指定 -->
        <form method="post" action="TestController">
            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">氏名</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <input type="text" name="name" class="col-12 border rounded px-4 fs-3" placeholder="氏名" required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">メールアドレス</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <input type="email" name="mail" class="col-12 border rounded px-4 fs-3" placeholder="メールアドレス" required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">パスワード</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <input type="password" name="pass" class="col-12 border rounded px-4 fs-3" placeholder="パスワード" required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">パスワード（確認）</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="col-8">
                    <input type="password" name="pass_confirm" class="col-12 border rounded px-4 fs-3" placeholder="パスワード（確認）" required>
                </div>
            </div>

            <div class="row offset-2 col-8 my-4">
                <div class="col-3 text-end fs-3">権限</div>
                <div class="col-1">
                    <div class="col-10 border rounded-pill text-white bg-secondary text-center fs-4">必須</div>
                </div>
                <div class="row col-8">
                    <div class="col-2">
                        <input type="radio" class="" name="permission" value="nothing" id="nothing">
                        <label class="fs-4" for="nothing">権限なし</label>
                    </div>
                    <div class="col-2">
                    <input type="radio" class="" name="permission" value="read" iid="read">
                    <label class="fs-4" for="read">参照</label>
                </div>
                    <div class="col-2">
                    <input type="radio" class="" name="permission" value="update" iid="update">
                    <label class="fs-4" for="update">更新</label>
                </div>
                </div>
            </div>
            <div class="col-2 offset-5">
                <button type="submit" class="col-6 btn btn-primary border rounded">✔　登　録</button>
            </div>
        </form>
    </div>
    <div>
    </div>
</body>

</html>