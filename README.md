# Database Samples Collection

## 📘 Guia Rápido de Comandos SQL

Este manual serve como uma referência rápida para os comandos SQL mais comuns, categorizados por sua função principal.

### 1. DDL - Data Definition Language

*   **Criar banco de dados:**
    ```sql
    CREATE DATABASE nome_do_banco_de_dados;
    ```

*   **Selecionar um banco de dados para usar:**
    ```sql
    USE nome_do_banco_de_dados;
    ```

*   **Criar tabela:**
    ```sql
    CREATE TABLE nome_da_tabela (
        id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE,
        data_nascimento DATE,
        salario DECIMAL(10, 2),
        data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    ```

*   **Criar índice:**
    ```sql
    CREATE INDEX idx_nome_coluna ON nome_da_tabela(nome_coluna);
    CREATE UNIQUE INDEX uidx_outra_coluna ON nome_da_tabela(outra_coluna);
    ```

*   **Modificar estrutura da tabela (ALTER TABLE):**
    ```sql
    ALTER TABLE nome_da_tabela ADD COLUMN nova_coluna VARCHAR(50);
    ```
    ```sql
    ALTER TABLE nome_da_tabela MODIFY COLUMN nome VARCHAR(150);
    ```
    ```sql
    ALTER TABLE nome_da_tabela CHANGE COLUMN nome_antigo nome_novo VARCHAR(150);
    ```
    ```sql
    ALTER TABLE nome_da_tabela DROP COLUMN coluna_a_remover;
    ```
    ```sql
    ALTER TABLE nome_da_tabela_filha
    ADD CONSTRAINT fk_nome_constraint
    FOREIGN KEY (coluna_fk) REFERENCES nome_da_tabela_pai(coluna_pk);
    ```

*   **Remover tabela, banco ou índice:**
    ```sql
    DROP TABLE nome_da_tabela;
    DROP TABLE IF EXISTS nome_da_tabela;
    ```
    ```sql
    DROP DATABASE nome_do_banco_de_dados;
    DROP DATABASE IF EXISTS nome_do_banco_de_dados;
    ```
    ```sql
    DROP INDEX idx_nome_coluna ON nome_da_tabela;
    ```

### 2. DML - Data Manipulation Language

*   **Inserir novos registros (INSERT):**
    ```sql
    INSERT INTO nome_da_tabela (nome, email, salario)
    VALUES ('João Silva', 'joao.silva@email.com', 5000.00);
    ```
    ```sql
    INSERT INTO nome_da_tabela (nome, data_nascimento)
    VALUES ('Maria Santos', '1990-05-15');
    ```
    ```sql
    INSERT INTO nome_da_tabela (nome, email) VALUES
    ('Carlos Pereira', 'carlos@email.com'),
    ('Ana Costa', 'ana@email.com');
    ```

*   **Atualizar dados existentes (UPDATE):**
    ```sql
    UPDATE nome_da_tabela
    SET email = 'joao.novo.email@email.com', salario = 5500.00
    WHERE id = 1;
    ```
    ```sql
    UPDATE nome_da_tabela
    SET salario = salario * 1.10
    WHERE data_nascimento < '1980-01-01';
    ```

*   **Remover registros (DELETE):**
    ```sql
    DELETE FROM nome_da_tabela WHERE id = 3;
    ```
    ```sql
    DELETE FROM nome_da_tabela WHERE salario < 2000.00;
    ```
    ```sql
    TRUNCATE TABLE nome_da_tabela;
    ```

*   **Consultar dados (SELECT):**
    ```sql
    SELECT * FROM nome_da_tabela;
    ```
    ```sql
    SELECT nome, email FROM nome_da_tabela;
    ```
    ```sql
    SELECT id, nome, salario FROM nome_da_tabela WHERE salario > 3000.00;
    ```
    ```sql
    SELECT nome, data_nascimento FROM nome_da_tabela ORDER BY data_nascimento DESC;
    ```
    ```sql
    SELECT * FROM nome_da_tabela LIMIT 10;
    ```
    ```sql
    SELECT * FROM nome_da_tabela ORDER BY id LIMIT 5 OFFSET 10;
    ```
    ```sql
    SELECT departamento, COUNT(*) AS total_funcionarios, AVG(salario) AS media_salarial
    FROM funcionarios
    GROUP BY departamento;
    ```
    ```sql
    SELECT pedidos.id_pedido, clientes.nome_cliente
    FROM pedidos
    INNER JOIN clientes ON pedidos.id_cliente = clientes.id;
    ```

### 3. TCL - Transaction Control Language

*   **Iniciar transação:**
    ```sql
    START TRANSACTION;
    ```
    ```sql
    BEGIN;
    ```

*   **Definir ponto intermediário (savepoint):**
    ```sql
    SAVEPOINT nome_do_savepoint;
    ```

*   **Desfazer até o savepoint:**
    ```sql
    ROLLBACK TO nome_do_savepoint;
    ```

*   **Desfazer toda a transação:**
    ```sql
    ROLLBACK;
    ```

*   **Confirmar alterações feitas na transação:**
    ```sql
    COMMIT;
    ```

### 4. DCL - Data Control Language

*   **Criar usuário:**
    ```sql
    CREATE USER 'novo_usuario'@'localhost' IDENTIFIED BY 'senha_segura';
    ```
    ```sql
    CREATE USER 'novo_usuario'@'%' IDENTIFIED BY 'senha_segura';
    ```

*   **Conceder permissões (GRANT):**
    ```sql
    GRANT SELECT, INSERT ON nome_do_banco_de_dados.nome_da_tabela TO 'novo_usuario'@'localhost';
    ```
    ```sql
    GRANT ALL PRIVILEGES ON nome_do_banco_de_dados.* TO 'novo_usuario'@'localhost';
    ```
    ```sql
    GRANT SELECT ON nome_da_tabela TO 'novo_usuario'@'localhost' WITH GRANT OPTION;
    ```
    ```sql
    FLUSH PRIVILEGES;
    ```

*   **Revogar permissões (REVOKE):**
    ```sql
    REVOKE INSERT ON nome_do_banco_de_dados.nome_da_tabela FROM 'novo_usuario'@'localhost';
    ```
    ```sql
    REVOKE ALL PRIVILEGES ON nome_do_banco_de_dados.* FROM 'novo_usuario'@'localhost';
    ```

*   **Remover usuário:**
    ```sql
    DROP USER 'novo_usuario'@'localhost';
    ```
    ```sql
    DROP USER IF EXISTS 'outro_usuario'@'%';
    ```

### 5. Outros Comandos Úteis

*   **Mostrar estrutura da tabela:**
    ```sql
    DESCRIBE nome_da_tabela;
    ```
    ```sql
    SHOW COLUMNS FROM nome_da_tabela;
    ```
    ```sql
    SHOW CREATE TABLE nome_da_tabela;
    ```

*   **Mostrar bancos de dados disponíveis:**
    ```sql
    SHOW DATABASES;
    ```

*   **Mostrar tabelas do banco de dados atual:**
    ```sql
    SHOW TABLES;
    ```

*   **Mostrar status do servidor:**
    ```sql
    SHOW STATUS;
    ```
    ```sql
    SHOW VARIABLES LIKE 'char%';
    ```

*   **Obter informações sobre usuários e suas permissões:**
    ```sql
    SHOW GRANTS FOR 'nome_usuario'@'host_de_acesso';
    ```
    ```sql
    SELECT user, host FROM mysql.user;
    ```