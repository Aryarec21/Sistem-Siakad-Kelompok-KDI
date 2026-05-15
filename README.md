# Sistem-Siakad-Kelompok-KDI


update
berfungsi
halaman login ke dashboard
halaman dashboard logout
database user mhs , dosen , admin

biar berfungsi pastikan xampp jalan taro semua file di C:\xampp\htdocs\siakadlogin

terus di http://localhost/phpmyadmin buka SQL 

paste:
CREATE DATABASE IF NOT EXISTS siakad;
USE siakad;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin','dosen','mahasiswa') NOT NULL
);

INSERT INTO users (username, password, role) VALUES
('241011130', MD5('241011130'), 'mahasiswa'),
('241011129', MD5('241011129'), 'mahasiswa');

klik go
