# Guia Rápido de Comandos SQL

Este guia fornece uma referência rápida para os comandos SQL mais comuns, categorizados por sua função principal.

## DDL (Data Definition Language)

| Comando | Descrição | Exemplo |
| --- | --- | --- |
| **CREATE** | Cria um novo banco de dados, tabela ou índice. | `CREATE DATABASE nome_do_banco;`<br>`CREATE TABLE nome_da_tabela (id INT, nome VARCHAR(50));`<br>`CREATE INDEX idx_nome ON nome_da_tabela(nome);` |
| **ALTER TABLE** | Modifica a estrutura de uma tabela existente. | `ALTER TABLE nome_da_tabela ADD email VARCHAR(100);`<br>`ALTER TABLE nome_da_tabela MODIFY nome VARCHAR(100);`<br>`ALTER TABLE nome_da_tabela DROP COLUMN email;` |
| **DROP** | Remove um banco de dados, tabela ou índice existente. | `DROP DATABASE nome_do_banco;`<br>`DROP TABLE nome_da_tabela;`<br>`DROP INDEX idx_nome ON nome_da_tabela;` |
| **USE** | Seleciona um banco de dados para usar. | `USE nome_do_banco;` |

## DML (Data Manipulation Language)

| Comando | Descrição | Exemplo |
| --- | --- | --- |
| **INSERT INTO** | Insere novos registros em uma tabela. | `INSERT INTO nome_da_tabela (id, nome) VALUES (1, 'João');` |
| **UPDATE** | Atualiza registros existentes em uma tabela. | `UPDATE nome_da_tabela SET nome = 'José' WHERE id = 1;` |
| **DELETE** | Remove registros de uma tabela. | `DELETE FROM nome_da_tabela WHERE id = 1;` |
| **TRUNCATE TABLE** | Remove todos os registros de uma tabela rapidamente. | `TRUNCATE TABLE nome_da_tabela;` |

## DQL (Data Query Language)

| Comando | Descrição | Exemplo |
| --- | --- | --- |
| **SELECT** | Consulta dados de uma ou mais tabelas. | `SELECT nome, email FROM usuarios;` |
| **FROM** | Especifica a tabela da qual os dados serão recuperados. | `SELECT * FROM usuarios;` |
| **WHERE** | Filtra os registros com base em uma condição. | `SELECT nome FROM usuarios WHERE idade > 18;` |
| **GROUP BY** | Agrupa os registros com base em uma ou mais colunas. | `SELECT cidade, COUNT(*) FROM usuarios GROUP BY cidade;` |
| **HAVING** | Filtra os grupos com base em uma condição. | `SELECT cidade, COUNT(*) FROM usuarios GROUP BY cidade HAVING COUNT(*) > 10;` |
| **ORDER BY** | Ordena os resultados com base em uma ou mais colunas. | `SELECT nome FROM usuarios ORDER BY nome ASC;` |
| **LIMIT** | Limita o número de registros retornados. | `SELECT * FROM usuarios LIMIT 10;` |
| **JOIN** | Combina registros de duas ou mais tabelas. | `SELECT u.nome, p.produto FROM usuarios u INNER JOIN compras p ON u.id = p.usuario_id;` |

## TCL (Transaction Control Language)

| Comando | Descrição | Exemplo |
| --- | --- | --- |
| **START TRANSACTION** | Inicia uma nova transação. | `START TRANSACTION;` |
| **COMMIT** | Salva permanentemente as alterações da transação. | `COMMIT;` |
| **ROLLBACK** | Desfaz as alterações da transação. | `ROLLBACK;` |
| **SAVEPOINT** | Define um ponto de salvamento dentro de uma transação. | `SAVEPOINT meu_ponto;` |

## DCL (Data Control Language)

| Comando | Descrição | Exemplo |
| --- | --- | --- |
| **GRANT** | Concede permissões a um usuário. | `GRANT SELECT, INSERT ON usuarios TO 'joao'@'localhost';` |
| **REVOKE** | Remove permissões de um usuário. | `REVOKE INSERT ON usuarios FROM 'joao'@'localhost';` |
| **CREATE USER** | Cria um novo usuário no banco de dados. | `CREATE USER 'joao'@'localhost' IDENTIFIED BY 'senha123';` |
| **DROP USER** | Remove um usuário existente. | `DROP USER 'joao'@'localhost';` |
