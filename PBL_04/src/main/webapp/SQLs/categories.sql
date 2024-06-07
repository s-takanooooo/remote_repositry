CREATE TABLE categories(
    category_id INT primary key not null,
    category_name VARCHAR(50) not null,
    active_flg INT not null default '1'
);