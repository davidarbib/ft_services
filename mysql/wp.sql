CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES on wordpress.* to 'root'@localhost;
FLUSH PRIVILEGES;
USE wordpress;
CREATE TABLE test (field VARCHAR(20));
insert into test values("coucou");
