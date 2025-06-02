# SQL Database Projects

Este repositório reúne uma coleção de projetos e exercícios práticos desenvolvidos para aprendizado e prática de SQL e design de bancos de dados relacionais.

---

## Conteúdo

- **Consultas SQL:** Scripts para operações básicas e avançadas (SELECT, JOIN, GROUP BY, SUBQUERIES, etc.)
- **Procedures e Triggers:** Exemplos de stored procedures, funções e triggers para automação no banco.
- **Scripts de criação e popularização:** Scripts para criação das tabelas e inserção de dados para testes.

---

## Tecnologias

- SQL padrão ANSI
- MySQL / MariaDB

---

## Manual SQL - Comandos Mais Comuns

Este documento serve como um guia rápido para os comandos SQL mais utilizados, categorizados por sua função principal.

## 1. DDL - Data Definition Language

Comandos para definir e modificar a estrutura do banco de dados.

*   **Criar tabela, banco ou índice:**

    ```sql
    CREATE TABLE tabela (
        id INT PRIMARY KEY,
        nome VARCHAR(50)
    );

    CREATE DATABASE meu_banco;

    CREATE INDEX idx_nome ON tabela(nome);
    ```

*   **Modificar estrutura da tabela:**

    ```sql
    ALTER TABLE tabela ADD COLUMN idade INT;
    ```

*   **Remover tabela, banco ou índice:**

    ```sql
    DROP TABLE tabela;
    DROP DATABASE meu_banco;
    DROP INDEX idx_nome ON tabela;
    ```

## 2. DML - Data Manipulation Language

Comandos para manipular dados (inserir, atualizar, deletar, consultar).

*   **Inserir novos registros:**

    ```sql
    INSERT INTO tabela (coluna1, coluna2) VALUES (valor1, valor2);
    ```

*   **Atualizar dados existentes:**

    ```sql
    UPDATE tabela SET coluna1 = novo_valor WHERE condicao;
    ```

*   **Remover registros:**

    ```sql
    DELETE FROM tabela WHERE condicao;
    ```

*   **Consultar dados:**

    ```sql
    SELECT coluna1, coluna2 FROM tabela WHERE condicao ORDER BY coluna1;
    ```

## 3. DTL/TCL - Data Transaction Language / Transaction Control Language

Comandos para controle de transações.

*   **Iniciar transação:**

    ```sql
    START TRANSACTION;
    ```

*   **Definir ponto intermediário (savepoint):**

    ```sql
    SAVEPOINT nome_savepoint;
    ```

*   **Desfazer até o savepoint:**

    ```sql
    ROLLBACK TO nome_savepoint;
    ```

*   **Desfazer toda a transação:**

    ```sql
    ROLLBACK;
    ```

*   **Confirmar alterações feitas na transação:**

    ```sql
    COMMIT;
    ```

## 4. DCL - Data Control Language

Comandos para controle de acesso e permissões.

*   **Conceder permissões:**

    ```sql
    GRANT SELECT, INSERT ON tabela TO usuario;
    ```

*   **Revogar permissões:**

    ```sql
    REVOKE INSERT ON tabela FROM usuario;
    ```

## 5. Outros comandos úteis

*   **Mostrar estrutura da tabela:**

    ```sql
    DESCRIBE tabela;
    ```

*   **Mostrar bancos de dados disponíveis:**

    ```sql
    SHOW DATABASES;
    ```

*   **Mostrar tabelas do banco atual:**

    ```sql
    SHOW TABLES;
    ```

*   **Obter informações sobre usuários e permissões (depende do SGBD):**

    ```sql
    SHOW GRANTS FOR usuario;
    ```