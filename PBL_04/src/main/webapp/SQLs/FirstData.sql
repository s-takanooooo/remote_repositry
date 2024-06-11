INSERT INTO accounts (name, mail,password, authority) VALUES ("山田太郎", "taro_yamada@tomatosystem.co.jp", "Taro1234", 1);
//category_idをAUTO_INCREMENT
ALTER TABLE categories MODIFY COLUMN category_id INT AUTO_INCREMENT;
//データinsert
INSERT INTO categories (category_name) VALUES("食料品");
INSERT INTO categories (category_name) VALUES("日用品");
//sale_idをAUTO_INCREMENT
ALTER TABLE sales MODIFY COLUMN sale_id INT AUTO_INCREMENT;