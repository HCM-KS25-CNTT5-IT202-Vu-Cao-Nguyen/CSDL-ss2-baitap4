create database baitap4;
use baitap4;

drop table if exists pains;

create table pains (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fullname VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Giải pháp 1: Sửa trực tiếp cột hiện tại int -> varchar
-- Giải pháp 2: thêm cột mới thêm cột phone_new với thuộc tính là varchar