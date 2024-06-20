-- accountsテーブルを作成
CREATE TABLE accounts (
    account_id INT primary key auto_increment not null,
    name VARCHAR(20) not null,
    mail VARCHAR(100) not null unique,
    password VARCHAR(30) not null,
    authority INT not null default '0'
);

-- categoriesテーブルを作成
CREATE TABLE categories(
    category_id INT primary key auto_increment not null ,
    category_name VARCHAR(50) not null,
    active_flg INT not null default '1'
);

-- salesテーブルを作成
CREATE TABLE sales (
    sale_id INT primary key auto_increment not null,
    sale_date DATE not null,
    account_id INT not null,
    category_id INT not null,
    trade_name VARCHAR(100) not null,
    unit_price INT not null,
    sale_number INT not null,
    note TEXT default null,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id),
    FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

-- 初期アカウントを追加
INSERT INTO accounts (name, mail,password, authority) VALUES 
('山田太郎', 'taro.yamada@example.com', 'password1', 0),
('鈴木次郎', 'jiro.suzuki@example.com', 'password2', 1),
('田中三郎', 'saburo.tanaka@example.com', 'password3', 10),
('佐藤四郎', 'shiro.sato@example.com', 'password4', 11),
('高橋五郎', 'goro.takahashi@example.com', 'password5', 0),
('伊藤六郎', 'rokuro.ito@example.com', 'password6', 1),
('渡辺七郎', 'shichiro.watanabe@example.com', 'password7', 10),
('山本八郎', 'hachiro.yamamoto@example.com', 'password8', 11),
('中村九郎', 'kuro.nakamura@example.com', 'password9', 0),
('小林十郎', 'juro.kobayashi@example.com', 'password10', 1),
('加藤十一郎', 'juichiro.kato@example.com', 'password11', 10),
('吉田十二郎', 'juniro.yoshida@example.com', 'password12', 11);

-- 初期カテゴリを登録
INSERT INTO categories (category_name, active_flg)
VALUES
    ('食料品', 1),
    ('日用品', 1),
    ('衣料品', 1),
    ('家電', 1),
    ('書籍', 1);
