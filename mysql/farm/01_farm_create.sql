create database farm;
GRANT ALL PRIVILEGES ON *.* TO 'farm'@'localhost'IDENTIFIED BY 'farmpass' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'farm'@'%' IDENTIFIED BY 'farmpass' WITH GRANT OPTION;
