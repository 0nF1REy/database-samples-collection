-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

DROP DATABASE IF EXISTS banco_db;

CREATE DATABASE banco_db;

USE banco_db;

/* COMANDO DDL */

CREATE TABLE tb_conta (
    id_conta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    saldo DOUBLE NOT NULL
);

/* COMANDO DML */

INSERT INTO tb_conta VALUE 
(NULL, 'Alan Ryan', 1000.00),
(NULL, 'Aerith Gainsborough', 1500.00);

/* COMANDOS DQL */

SELECT * FROM tb_conta;

START TRANSACTION;

UPDATE tb_conta SET saldo = saldo - 100 WHERE id_conta = 2;
UPDATE tb_conta SET saldo = saldo + 100 WHERE id_conta = 1;

/* COMANDOS DTL/TCL */

SAVEPOINT transferencia;

UPDATE tb_conta SET saldo = 0 WHERE id_conta = 1;

ROLLBACK TO transferencia;

ROLLBACK;

COMMIT;