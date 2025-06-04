CREATE DATABASE empresa_woop;

CREATE ROLE desenvolvimento, gerente, venda;

SELECT User, Host FROM mysql.user;

CREATE USER 'diego'@'localhost' IDENTIFIED BY 's3nh@';
CREATE USER 'marcia'@'localhost' IDENTIFIED BY 'abc1234';
CREATE USER 'joana'@'localhost' IDENTIFIED BY 'user123';

GRANT desenvolvimento TO diego@localhost;
GRANT gerente TO marcia@localhost;
GRANT venda TO joana@localhost;

SHOW GRANTS for 'desenvolvimento';

-- Mostrar todos que fazem parte de cada grupo
SHOW TABLES FROM MYSQL LIKE 'roles_mapping';

GRANT ALL PRIVILEGES ON *.* TO desenvolvimento;