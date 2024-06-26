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
    
-- テスト用売上データを作成
INSERT INTO sales (sale_date, account_id, category_id, trade_name, unit_price, sale_number, note) VALUES
('2024-01-01', 1, 1, 'Product A', 100, 10, 'Note 1'),
('2024-01-02', 2, 2, 'Product B', 200, 20, 'Note 2'),
('2024-01-03', 3, 3, 'Product C', 300, 30, 'Note 3'),
('2024-01-04', 4, 4, 'Product D', 400, 40, 'Note 4'),
('2024-01-05', 5, 5, 'Product E', 500, 50, 'Note 5'),
('2024-01-06', 6, 1, 'Product F', 600, 60, 'Note 6'),
('2024-01-07', 7, 2, 'Product G', 700, 70, 'Note 7'),
('2024-01-08', 8, 3, 'Product H', 800, 80, 'Note 8'),
('2024-01-09', 9, 4, 'Product I', 900, 90, 'Note 9'),
('2024-01-10', 10, 5, 'Product J', 1000, 100, 'Note 10'),
('2024-01-11', 11, 1, 'Product K', 1100, 110, 'Note 11'),
('2024-01-12', 12, 2, 'Product L', 1200, 120, 'Note 12'),
('2024-01-13', 1, 3, 'Product M', 1300, 130, 'Note 13'),
('2024-01-14', 2, 4, 'Product N', 1400, 140, 'Note 14'),
('2024-01-15', 3, 5, 'Product O', 1500, 150, 'Note 15'),
('2024-01-16', 4, 1, 'Product P', 1600, 160, 'Note 16'),
('2024-01-17', 5, 2, 'Product Q', 1700, 170, 'Note 17'),
('2024-01-18', 6, 3, 'Product R', 1800, 180, 'Note 18'),
('2024-01-19', 7, 4, 'Product S', 1900, 190, 'Note 19'),
('2024-01-20', 8, 5, 'Product T', 2000, 200, 'Note 20'),
('2024-01-21', 9, 1, 'Product U', 2100, 210, 'Note 21'),
('2024-01-22', 10, 2, 'Product V', 2200, 220, 'Note 22'),
('2024-01-23', 11, 3, 'Product W', 2300, 230, 'Note 23'),
('2024-01-24', 12, 4, 'Product X', 2400, 240, 'Note 24'),
('2024-01-25', 1, 5, 'Product Y', 2500, 250, 'Note 25'),
('2024-01-26', 2, 1, 'Product Z', 2600, 260, 'Note 26'),
('2024-01-27', 3, 2, 'Product AA', 2700, 270, 'Note 27'),
('2024-01-28', 4, 3, 'Product AB', 2800, 280, 'Note 28'),
('2024-01-29', 5, 4, 'Product AC', 2900, 290, 'Note 29'),
('2024-01-30', 6, 5, 'Product AD', 3000, 300, 'Note 30');

INSERT INTO sales (sale_date, account_id, category_id, trade_name, unit_price, sale_number, note) VALUES
('2023-01-01', 1, 1, 'Product A', 90, 9, 'Note 1'),
('2023-01-02', 2, 2, 'Product B', 180, 18, 'Note 2'),
('2023-01-03', 3, 3, 'Product C', 270, 27, 'Note 3'),
('2023-01-04', 4, 4, 'Product D', 360, 36, 'Note 4'),
('2023-01-05', 5, 5, 'Product E', 450, 45, 'Note 5'),
('2023-01-06', 6, 1, 'Product F', 540, 54, 'Note 6'),
('2023-01-07', 7, 2, 'Product G', 630, 63, 'Note 7'),
('2023-01-08', 8, 3, 'Product H', 720, 72, 'Note 8'),
('2023-01-09', 9, 4, 'Product I', 810, 81, 'Note 9'),
('2023-01-10', 10, 5, 'Product J', 900, 90, 'Note 10'),
('2023-01-11', 11, 1, 'Product K', 990, 99, 'Note 11'),
('2023-01-12', 12, 2, 'Product L', 1080, 108, 'Note 12'),
('2023-01-13', 1, 3, 'Product M', 1170, 117, 'Note 13'),
('2023-01-14', 2, 4, 'Product N', 1260, 126, 'Note 14'),
('2023-01-15', 3, 5, 'Product O', 1350, 135, 'Note 15'),
('2023-01-16', 4, 1, 'Product P', 1440, 144, 'Note 16'),
('2023-01-17', 5, 2, 'Product Q', 1530, 153, 'Note 17'),
('2023-01-18', 6, 3, 'Product R', 1620, 162, 'Note 18'),
('2023-01-19', 7, 4, 'Product S', 1710, 171, 'Note 19'),
('2023-01-20', 8, 5, 'Product T', 1800, 180, 'Note 20'),
('2023-01-21', 9, 1, 'Product U', 1890, 189, 'Note 21'),
('2023-01-22', 10, 2, 'Product V', 1980, 198, 'Note 22'),
('2023-01-23', 11, 3, 'Product W', 2070, 207, 'Note 23'),
('2023-01-24', 12, 4, 'Product X', 2160, 216, 'Note 24'),
('2023-01-25', 1, 5, 'Product Y', 2250, 225, 'Note 25'),
('2023-01-26', 2, 1, 'Product Z', 2340, 234, 'Note 26'),
('2023-01-27', 3, 2, 'Product AA', 2430, 243, 'Note 27'),
('2023-01-28', 4, 3, 'Product AB', 2520, 252, 'Note 28'),
('2023-01-29', 5, 4, 'Product AC', 2610, 261, 'Note 29'),
('2023-01-30', 6, 5, 'Product AD', 2700, 270, 'Note 30');


