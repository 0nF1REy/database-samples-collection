
# Guia Rápido de Comandos Cypher

Este guia fornece uma referência rápida para os comandos e cláusulas mais comuns em Cypher, a linguagem de consulta para Neo4j e outros bancos de dados de grafos.

## **Leitura de Dados**

| Comando | Descrição | Exemplo |
| --- | --- | --- |
| **MATCH** | Especifica os padrões a serem pesquisados no grafo. | `MATCH (p:Pessoa)-[:ATUOU_EM]->(f:Filme) RETURN p, f` |
| **OPTIONAL MATCH** | Semelhante ao `MATCH`, mas se nenhum resultado for encontrado, preenche as partes ausentes com `null` em vez de falhar a consulta. | `OPTIONAL MATCH (p:Pessoa)-[:DIRIGIU]->(f:Filme) RETURN p.nome, f.titulo` |
| **WHERE** | Adiciona restrições aos padrões em uma cláusula `MATCH` ou `OPTIONAL MATCH`. | `MATCH (p:Pessoa) WHERE p.nascimento > 1970 RETURN p.nome` |
| **RETURN** | Especifica o que incluir no conjunto de resultados. | `MATCH (p:Pessoa) RETURN p.nome, p.nascimento` |
| **ORDER BY** | Ordena os resultados. | `MATCH (p:Pessoa) RETURN p.nome, p.nascimento ORDER BY p.nascimento DESC` |
| **LIMIT** | Restringe o número de linhas na saída. | `MATCH (p:Pessoa) RETURN p.nome LIMIT 10` |
| **SKIP** | Pula um número especificado de linhas no conjunto de resultados. | `MATCH (p:Pessoa) RETURN p.nome SKIP 5 LIMIT 10` |
| **WITH** | Passa os resultados de uma parte de uma consulta para a próxima, permitindo o encadeamento de partes da consulta. | `MATCH (p:Pessoa)-[:ATUOU_EM]->(f:Filme) WITH p, count(f) AS filmes_atuados WHERE filmes_atuados > 5 RETURN p.nome` |
| **UNWIND** | Expande uma lista em uma sequência de linhas. | `UNWIND [1, 2, 3] AS x RETURN x` |
| **UNION** | Combina os resultados de duas ou more consultas, removendo duplicatas. | `MATCH (a:Ator) RETURN a.nome AS nome UNION MATCH (f:Filme) RETURN f.titulo AS nome` |
| **UNION ALL** | Combina os resultados de duas ou mais consultas, incluindo todas as linhas duplicadas. | `MATCH (a:Ator) RETURN a.nome AS nome UNION ALL MATCH (f:Filme) RETURN f.titulo AS nome` |

## **Escrita de Dados**

| Comando | Descrição | Exemplo |
| --- | --- | --- |
| **CREATE** | Cria nós e relacionamentos. | `CREATE (p:Pessoa {nome: 'Alice', nascimento: 1990})` |
| **MERGE** | Corresponde a um padrão ou o cria se ele não existir. Pode ser combinado com `ON CREATE` e `ON MATCH` para atualizações condicionais. | `MERGE (p:Pessoa {nome: 'Alice'}) ON CREATE SET p.criado = timestamp() ON MATCH SET p.ultimo_acesso = timestamp()` |
| **SET** | Adiciona ou atualiza propriedades em nós e relacionamentos. | `MATCH (p:Pessoa {nome: 'Alice'}) SET p.nascimento = 1991` |
| **REMOVE** | Remove propriedades ou rótulos de nós e relacionamentos. | `MATCH (p:Pessoa {nome: 'Alice'}) REMOVE p.nascimento` |
| **DELETE** | Deleta nós e relacionamentos. | `MATCH (p:Pessoa {nome: 'Alice'}) DELETE p` |
| **DETACH DELETE** | Deleta um nó e todos os relacionamentos conectados a ele. | `MATCH (p:Pessoa {nome: 'Alice'}) DETACH DELETE p` |
| **FOREACH** | Executa uma ação de atualização para cada elemento em uma lista. | `FOREACH (nome IN ['Alice', 'Bob'] | CREATE (:Pessoa {nome: nome}))` |

## **Cláusulas e Funções Gerais**

| Cláusula/Função | Descrição | Exemplo |
| --- | --- | --- |
| **Rótulos** | Usados para agrupar nós. Um nó pode ter zero ou mais rótulos. | `MATCH (p:Pessoa:Ator) RETURN p` |
| **Relacionamentos** | Conectam nós e têm um tipo e uma direção. | `MATCH (p:Pessoa)-[r:ATUOU_EM]->(f:Filme) RETURN type(r)` |
| **Propriedades** | Pares de chave-valor que podem ser armazenados em nós e relacionamentos. | `MATCH (p:Pessoa) WHERE p.nome = 'Tom Hanks' RETURN p` |
| **Parâmetros** | Usados para passar valores para uma consulta. | `MATCH (p:Pessoa {nome: $nome_param}) RETURN p` |
| **Agregação** | Funções como `count()`, `sum()`, `avg()`, `min()`, `max()` e `collect()`. | `MATCH (p:Pessoa) RETURN count(p)` |
| **Índices e Restrições** | Usados para otimizar o desempenho da consulta e garantir a integridade dos dados. | `CREATE INDEX ON :Pessoa(nome)`<br>`CREATE CONSTRAINT ON (p:Pessoa) ASSERT p.nome IS UNIQUE` |
| **LOAD CSV** | Carrega dados de um arquivo CSV. | `LOAD CSV WITH HEADERS FROM 'file:///pessoas.csv' AS linha CREATE (:Pessoa {nome: linha.nome})` |
