create database bugs_oltp;
GRANT ALL PRIVILEGES ON bugs_oltp.* TO 'bugs'@'localhost'IDENTIFIED BY 'Aa3E6aKZ' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON bugs_oltp.* TO 'bugs'@'%' IDENTIFIED BY 'Aa3E6aKZ' WITH GRANT OPTION;