CREATE TABLE sales (
    sale_id INT primary key not null,
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