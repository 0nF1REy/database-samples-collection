-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

DROP DATABASE IF EXISTS loja_virtual;

CREATE DATABASE loja_virtual; 

USE loja_virtual;

/* COMANDOS DDL */

-- Tabela de Produto
CREATE TABLE Produto ( 
  idProduto INT PRIMARY KEY AUTO_INCREMENT,
  nomeProduto VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  categoria VARCHAR(50) NOT NULL
);

-- Tabela de Cliente
CREATE TABLE Cliente (
  idCliente INT PRIMARY KEY AUTO_INCREMENT,
  nomeCliente VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL,
  endereco VARCHAR(150) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  estado VARCHAR(2) NOT NULL
);

-- Tabela de Pedido
CREATE TABLE Pedido (
  idPedido INT PRIMARY KEY AUTO_INCREMENT,
  idCliente INT NOT NULL,
  data_pedido DATE NOT NULL,
  status_pedido VARCHAR(50) NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela de Itens Pedido
CREATE TABLE Itens_Pedido (
  idItemPedido INT PRIMARY KEY AUTO_INCREMENT,
  idPedido INT NOT NULL,
  idProduto INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

/* COMANDOS DML */

INSERT INTO Produto (nomeProduto, descricao, preco_unitario, categoria)
VALUES
  ('Camisa X', 'Camisa de algodão masculina, tamanho M', 59.90, 'Vestuário'),
  ('Livro Y', 'Um romance de fantasia empolgante', 34.90, 'Livros'),
  ('Teclado Z', 'Teclado mecânico para jogos com подсветas RGB', 199.00, 'Eletrônicos'),
  ('Smartphone W', 'Smartphone Android com tela de 6 polegadas e câmera tripla', 899.99, 'Celulares'),
  ('Cafeteira A', 'Cafeteira elétrica com filtro permanente', 129.90, 'Eletrodomésticos'),
  ('Tênis B', 'Tênis esportivo masculino para corrida', 139.90, 'Calçados'),
  ('Jogo C', 'Jogo de videogame de ação e aventura', 199.90, 'Jogos'),
  ('Fones de Ouvido D', 'Fones de ouvido Bluetooth com cancelamento de ruído', 299.90, 'Acessórios'),
  ('TV E', 'Smart TV 4K de 50 polegadas', 2799.00, 'Eletrodomésticos'),
  ('Bicicleta F', 'Bicicleta aro 26 para passeios urbanos', 499.90, 'Esporte e Lazer');


INSERT INTO Cliente (nomeCliente, email, endereco, cidade, estado)
VALUES
  ('Ana Silva', 'ana.silva@email.com', 'Rua das Flores, 123', 'São Paulo', 'SP'),
  ('João Oliveira', 'joao.oliveira@email.com', 'Avenida Paulista, 456', 'São Paulo', 'SP'),
  ('Maria Costa', 'maria.costa@email.com', 'Rua Tiradentes, 789', 'Rio de Janeiro', 'RJ'),
  ('Pedro Souza', 'pedro.souza@email.com', 'Alameda Santos, 100', 'Belo Horizonte', 'MG'),
  ('Isabella Almeida', 'isabella.almeida@email.com', 'Rua do Comércio, 234', 'Salvador', 'BA'),
  ('Bruno Araújo', 'bruno.araujo@email.com', 'Rua XV de Novembro, 567', 'Curitiba', 'PR'),
  ('Sofia Santos', 'sofia.santos@email.com', 'Quadra 12, Lote 34', 'Brasília', 'DF'),
  ('Eduardo Pereira', 'eduardo.pereira@email.com', 'Avenida Beira Mar, 987', 'Florianópolis', 'SC'),
  ('Larissa Gomes', 'larissa.gomes@email.com', 'Rua das Camélias, 12', 'Manaus', 'AM'),
  ('Ricardo Dias', 'ricardo.dias@email.com', 'Rua Major Maragliano, 345', 'Porto Alegre', 'RS');

INSERT INTO Pedido (idCliente, data_pedido, status_pedido)
VALUES
  (1, '2024-05-05', 'Em Processamento'),
  (2, '2024-05-06', 'Pago'),
  (3, '2024-05-07', 'Enviado'),
  (4, '2024-05-04', 'Finalizado'),
  (5, '2024-05-02', 'Cancelado'),
  (6, '2024-05-07', 'Em Processamento'),
  (1, '2024-05-05', 'Pago'), 
  (9, '2024-05-06', 'Enviado'),
  (10, '2024-05-03', 'Finalizado');

INSERT INTO Itens_Pedido (idPedido, idProduto, quantidade, preco_unitario) VALUES
(1, 4, 1, 34.90),
(1, 5, 2, 199.00),
(2, 1, 1, 59.90),
(2, 2, 1, 899.99),
(3, 6, 1, 129.90),
(3, 7, 1, 199.90),
(4, 3, 2, 299.90),
(4, 9, 1, 499.90),
(5, 8, 1, 2799.00),
(6, 10, 3, 139.90),
(7, 7, 2, 34.90),
(7, 3, 1, 199.00),
(9, 1, 1, 59.90);
