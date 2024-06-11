INSERT INTO accounts (name, mail,password, authority) VALUES ("山田太郎", "taro_yamada@tomatosystem.co.jp", "Taro1234", 1);
//category_idをAUTO_INCREMENT
ALTER TABLE categories MODIFY COLUMN category_id INT AUTO_INCREMENT;
//データinsert
INSERT INTO categories (category_name) VALUES("食料品");
INSERT INTO categories (category_name) VALUES("日用品");
//sale_idをAUTO_INCREMENT
ALTER TABLE sales MODIFY COLUMN sale_id INT AUTO_INCREMENT;
//sales	のデータinsert
INSERT INTO sales (sale_date,account_id,category_id,trade_name,unit_price,sale_number,note) VALUES("2024-06-11",1,1,"りんご",100,1000,"青森県産");