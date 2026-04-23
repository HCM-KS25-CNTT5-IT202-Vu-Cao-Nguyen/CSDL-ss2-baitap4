
CREATE DATABASE baitap4;
USE baitap4;

DROP TABLE IF EXISTS patients;

-- Tạo bảng ban đầu (thiết kế cũ dùng INT cho phone)
CREATE TABLE patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    phone INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Dữ liệu mẫu
INSERT INTO patients(fullname, phone)
VALUES
('Nguyen Van A', 912345678),
('Tran Thi B', 987654321);



/* =====================================================
GIẢI PHÁP 1: SỬA TRỰC TIẾP KIỂU DỮ LIỆU
===================================================== */

ALTER TABLE patients
MODIFY COLUMN phone VARCHAR(15);



/* =====================================================
GIẢI PHÁP 2: THÊM CỘT MỚI (AN TOÀN HƠN)
===================================================== */


-- Thêm cột mới
ALTER TABLE patients
ADD COLUMN phone_new VARCHAR(15);

-- Chuyển dữ liệu từ cột cũ sang cột mới
UPDATE patients
SET phone_new = phone;

-- Kiểm tra dữ liệu
SELECT id, fullname, phone, phone_new
FROM patients;

-- Xóa cột cũ
ALTER TABLE patients
DROP COLUMN phone;

-- Đổi tên cột mới thành phone
ALTER TABLE patients
CHANGE phone_new phone VARCHAR(15);