CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES on wordpress.* to 'toto'@'%' identified by '1234';
FLUSH PRIVILEGES;
EXIT
