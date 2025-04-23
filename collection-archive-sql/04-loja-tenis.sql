-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

-- COMANDOS DDL
CREATE DATABASE LojaTenis;

USE LojaTenis;

CREATE TABLE CategoriaTenis (
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR(30) NOT NULL
);

CREATE TABLE MarcaTenis (
	idMarca INT PRIMARY KEY AUTO_INCREMENT,
    nomeMarca VARCHAR(40) NOT NULL
);

CREATE TABLE Tenis (
	idTenis INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(30) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    tamanho INT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    idMarca INT NOT NULL,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idMarca) REFERENCES MarcaTenis(idMarca),
    FOREIGN KEY (idCategoria) REFERENCES CategoriaTenis(idCategoria)
);

-- COMANDOS DML
INSERT INTO CategoriaTenis (nomeCategoria) VALUES
('Corrida'),
('Basquete'),
('Skate'),
('Casual'),
('Trilha');

INSERT INTO MarcaTenis (nomeMarca) VALUES
('Nike'),
('Adidas'),
('Puma'),
('Reebok'),
('New Balance'),
('Mizuno'),
('Vans'),
('Fila');

INSERT INTO Tenis (modelo, preco, tamanho, cor, idMarca, idCategoria) VALUES
('Air Zoom Pegasus', 299.99, 35, 'Preto/Vermelho', 1, 1),
('Superstar', 249.99, 39, 'Branco/Preto', 2, 4),
('Suede Classic', 149.99, 38, 'Azul', 3, 4),
('Classic Leather', 129.99, 40, 'Branco', 4, 4),
('Fresh Foam Roav', 199.99, 34, 'Cinza/Rosa', 5, 4),
('Air Max 270', 169.99, 41, 'Branco/Azul', 1, 4),
('Chuck Taylor All Star', 79.99, 36, 'Preto', 2, 4),
('Cell Venom', 119.99, 38, 'Preto/Amarelo', 3, 4),
('Club C 85', 89.99, 39, 'Branco', 4, 4),
('FuelCore Nergize', 79.99, 37, 'Cinza', 5, 4);

-- |===========|
-- |Exercício 1| MOSTRAR TODOS OS CAMPOS DA TABELA MARCA
-- |===========|
SELECT * FROM MarcaTenis;

-- |===========|
-- |Exercício 2| MOSTRAR TODOS OS CAMPOS DA TABELA CATEGORIA 
-- |===========|
SELECT * FROM CategoriaTenis;

-- |===========|
-- |Exercício 3| MOSTRAR TODOS OS CAMPOS DA TABELA TENIS 
-- |===========|
SELECT * FROM Tenis;

-- |===========|
-- |Exercício 4| MOSTRAR OS CAMPOS "MODELO" E "PRECO" DOS TÊNIS DA MARCA NIKE 
-- |===========|

-- Primeiro jeito
SELECT modelo, preco FROM tenis WHERE idMarca = 1;

-- Segundo jeito
SELECT modelo, preco FROM tenis WHERE idMarca = 
(SELECT idMarca FROM MarcaTenis WHERE nomeMarca = "Nike");

-- |===========|
-- |Exercício 5| MOSTRAR OS CAMPOS “MODELO”, “PRECO” E “TAMANHO” DOS TÊNIS DA MARCA REEBOK
-- |===========|

SELECT modelo, preco, tamanho FROM tenis WHERE idMarca = 4;

-- |===========|
-- |Exercício 6| MOSTRAR OS CAMPOS “MODELO” E” PRECO” DOS TÊNIS ACIMA DE 150 REAIS. 
-- |===========|

SELECT modelo, preco FROM tenis WHERE preco >= 150.0;

-- |===========|
-- |Exercício 7| MOSTRAR OS CAMPOS “MODELO” E “TAMANHO” DOS TÊNIS ORDENANDO DE FORMA CRESCENTE POR TAMANHO. 
-- |===========|

SELECT modelo, tamanho FROM tenis ORDER BY tamanho ASC;

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

-- |===========|
-- |Exercício x| 
-- |===========|

# https://anotepad.com/notes/9td4a3ew