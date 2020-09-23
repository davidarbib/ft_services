CREATE USER 'root'@localhost IDENTIFIED BY 'root';
CREATE DATABASE wp;
GRANT ALL PRIVILEGES on wp.* to 'admin'@localhost;
FLUSH PRIVILEGES;
USE wp;
CREATE TABLE test (field VARCHAR(20));
