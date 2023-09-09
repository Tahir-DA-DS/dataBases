CREATE DATABASE inventory;

USE inventory;

SHOW tables;

CREATE TABLE
    users (
        id int primary key,
        username varchar(254),
        password char,
        gender enum ("M", "F"),
        birthdate date
    );

CREATE TABLE
    admin (
        id int,
        name varchar(254),
        users_id int,
        foreign key (users_id) references users (id)
    );

CREATE TABLE
    customer (
        id int primary key,
        name varchar(254),
        phone char(11),
        address varchar(245),
        users_id int,
        created_at datetime,
        foreign key (users_id) references users (id)
    );

CREATE TABLE
    category (
        id int primary key,
        name varchar(254),
        quantity int,
        description varchar(245)
    );

CREATE TABLE
    product (
        id int primary key,
        name varchar(254),
        quantity int,
        size int,
        price bigint,
        category_id int,
        customer_id int,
        foreign key (customer_id) references customer (id)
    );

CREATE TABLE
    pruduct_order (
        id int,
        cusromer_id int,
        quantity bigint,
        product_id int,
        foreign key (product_id) references product (id)
    );

INSERT INTO
    users
VALUES
    (01, "IRISE", 'p', 'F', '2022-08-9'),
    (02, "peace", 'h', 'M', '2001-04-9'),
    (05, 'Musa', 'a', 'M', '2025-01-08'),
    (04, 'Isah', 'j', 'M', '2024-04-09');

INSERT INTO
    admin
VALUES
    (04, 'adeola', '01'),
    (01, 'adeola', '02');

INSERT INTO
    category
VALUES
    (03, 'NUTS', 425, 'dry brown body'),
    (01, 'grocerries', 105, 'fresh berry flavour'),
    (04, 'seasioning', 3452, 'small cubes'),
    (05, 'fashion', 2065, 'glasses, bags, and shoes');

INSERT INTO
    customer
VALUES
    (
        1,
        'yale',
        '08133339',
        'london Ibadan road Nigeria',
        02,
        '2023-09-08 23:59:59'
    ),
    (
        0,
        'jane',
        '08133339',
        'london Ibadan road Nigeria',
        01,
        '2023-09-08 22:59:59'
    );

INSERT INTO
    product
VALUES
    (04, 'shoes', 42, 45, 4, 1250, 0),
    (01, 'OK BISCUIT', 34, 5, 250, 01, 0),
    (02, 'utencil', 34, 5, 250, 02, 1);

INSERT INTO
    pruduct_order
VALUES
    (02, 1, 241, 02),
    (01, 0, 420, 04);

-- querying tables from inventory database
SELECT
    *
FROM
    category;

SELECT
    description
FROM
    category
WHERE
    id = 5;

UPDATE pruduct_order
SET
    quantity = 200
WHERE
    product_id = 04;

UPDATE product
SET
    name = 'balls'
WHERE
    id = 02;

DELETE FROM users
WHERE
    id = 05;

DELETE FROM category
WHERE
    id = 04