CREATE TABLE accounts (
    account_id INT primary key not null,
    name VARCHAR(20) not null,
    mail VARCHAR(100) not null,
    password VARCHAR(30) not null,
    authority INT not null default '0'
);

