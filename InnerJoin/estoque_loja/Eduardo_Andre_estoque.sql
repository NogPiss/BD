CREATE DATABASE Estoque;
use Estoque;

CREATE TABLE Cidade (
  codcidade INT  NOT NULL ,
  cidade VARCHAR(30) NULL,
  uf CHAR(2) NULL,
  PRIMARY KEY(codcidade)
);

 
CREATE TABLE Categoria (
  codcategoria INT  NOT NULL ,
  categoria VARCHAR(20) NULL,
  PRIMARY KEY(codcategoria)
);
 
CREATE TABLE Transportadora (
  codtransportadora INT  NOT NULL ,
  Cidade_codcidade INT  NOT NULL,
  transportadora VARCHAR(35) NULL,
  endereco VARCHAR(30) NULL,
  num INT  NULL,
  bairro VARCHAR(20) NULL,
  cep CHAR(9) NULL,
  cnpj CHAR(18) NULL,
  insc VARCHAR(10) NULL,
  contato VARCHAR(20) NULL,
  tel CHAR(14) NULL,
  PRIMARY KEY(codtransportadora),
  FOREIGN KEY (Cidade_codcidade) REFERENCES cidade(codcidade)
);

CREATE TABLE Loja (
  codloja INT  NOT NULL ,
  Cidade_codcidade INT  NOT NULL,
  nome VARCHAR(35) NULL,
  endereco VARCHAR(30) NULL,
  num INT  NULL,
  bairro VARCHAR(10) NULL,
  tel CHAR(14) NULL,
  insc VARCHAR(10) NULL,
  cnpj CHAR(18) NULL,
  cep CHAR(9) NULL,
  PRIMARY KEY(codloja),
  FOREIGN KEY (Cidade_codcidade) 
  REFERENCES cidade(codcidade)
);
 
CREATE TABLE Entrada (
  codentrada INT  NOT NULL ,
  Transportadora_codtransportadora 
  INT  NOT NULL,
  dataped DATE NULL,
  dataentr DATE NULL,
  total REAL NULL,
  frete REAL NULL,
  numnf INT  NULL,
  imposto REAL NULL,
  PRIMARY KEY(codentrada),
  FOREIGN KEY (Transportadora_codtransportadora) REFERENCES Transportadora(codtransportadora)
);
 
CREATE TABLE Fornecedor (
  codfornecedor INT  NOT NULL ,
  Cidade_codcidade INT  NOT NULL,
  fornecedor VARCHAR(35) NULL,
  endereco VARCHAR(30) NULL,
  num INT  NULL,
  bairro VARCHAR(20) NULL,
  cep CHAR(9) NULL,
  contato VARCHAR(20) NULL,
  cnpj CHAR(18) NULL,
  insc VARCHAR(10) NULL,
  tel CHAR(14) NULL,
  PRIMARY KEY(codfornecedor),
  FOREIGN KEY(Cidade_codcidade) 
  REFERENCES Cidade(codcidade)
);
 
CREATE TABLE Saida (
  codsaida INT  NOT NULL ,
  Loja_codloja INT  NOT NULL,
  Transportadora_codtransportadora 
  INT  NOT NULL,
  total REAL NULL,
  frete REAL NULL,
  imposto REAL NULL,
  PRIMARY KEY(codsaida),
  FOREIGN KEY(Transportadora_codtransportadora) REFERENCES   Transportadora(codtransportadora),
  FOREIGN KEY(Loja_codloja) 
  REFERENCES Loja(codloja)
);
 
CREATE TABLE Produto (
  codproduto INT  NOT NULL ,
  Categoria_codcategoria INT  NOT NULL,
  Fornecedor_codfornecedor INT  NOT NULL,
  descricao VARCHAR(255) NULL,
  peso REAL NULL,
  qtdemin INT  NULL,
  PRIMARY KEY(codproduto),
  FOREIGN KEY(Fornecedor_codfornecedor) REFERENCES Fornecedor(codfornecedor),
  FOREIGN KEY(Categoria_codcategoria) REFERENCES Categoria(codcategoria)
);
 
CREATE TABLE ItemEntrada (
  coditementrada INT  NOT NULL ,
  Produto_codproduto INT  NOT NULL,
  Entrada_codentrada INT  NOT NULL,
  lote VARCHAR(6) NULL,
  qtde INT  NULL,
  valor REAL NULL,
  PRIMARY KEY(coditementrada),
  FOREIGN KEY(Entrada_codentrada) REFERENCES Entrada(codentrada),
  FOREIGN KEY(Produto_codproduto) REFERENCES Produto(codproduto)
);
 
CREATE TABLE ItemSaida (
  coditemsaida INT  NOT NULL ,
  Saida_codsaida INT  NOT NULL,
  Produto_codproduto INT  NOT NULL,
  lote VARCHAR(6) NULL,
  qtde INT  NULL,
  valor REAL NULL,
  PRIMARY KEY(coditemsaida),
  FOREIGN KEY(Produto_codproduto) 
  REFERENCES Produto(codproduto),
  FOREIGN KEY(Saida_codsaida) 
  REFERENCES Saida(codsaida)
);


INSERT INTO categoria (codcategoria,  categoria) VALUES (1, 'Eletrônico');
INSERT INTO categoria VALUES (2, 'Eletrodoméstico');
INSERT INTO categoria VALUES (3, 'Informática');
INSERT INTO categoria VALUES (4, 'Telefonia');
INSERT INTO categoria VALUES (5, 'Móveis');
 
 select * from categoria

INSERT INTO cidade VALUES (1, 'Muriaé', 'MG');
INSERT INTO cidade VALUES (2, 'Belo Horizonte', 'MG');
INSERT INTO cidade VALUES (3, 'Divinópolis', 'MG');
INSERT INTO cidade VALUES (4, 'São Paulo', 'SP');
INSERT INTO cidade VALUES (5, 'Santo André', 'SP');
INSERT INTO cidade VALUES (6, 'Vitória', 'ES');
INSERT INTO cidade VALUES (7, 'Guarapari', 'ES');
INSERT INTO cidade VALUES (8, 'Rio de Janeiro', 'RJ');
 

INSERT INTO Loja VALUES (1, 1, 'Paraíso dos Eletrodomésticos', 'Rua João da Silva', 100, 'Centro', '1111-2222', '123.321.00', '94.405.385/0001-35', '00000-000');
INSERT INTO Loja VALUES (2, 2, 'Eletromundo', 'Rua 1º de maio', 1500, 'Centro', '1111-2221', '123.456.00', '94.405.385/0002-35', '00000-000');
INSERT INTO Loja VALUES (3, 3, 'Minaseletro', 'Rua JK', 95, 'Centro', '1111-2223', '654.321.00', '94.405.385/0003-35', '00000-000');
INSERT INTO Loja VALUES (4, 4, 'SPEletro', 'Rua A', 102, 'Centro', '1111-2224', '123.321.04', '94.405.385/0004-35', '00000-000');
INSERT INTO Loja VALUES (5, 5, 'Eletrodomésticos e cia.', 'Rua José Junior', 71, 'Centro', '1111-2225', '123.321.05', '94.405.385/0005-35', '00000-000');
INSERT INTO Loja VALUES (6, 6, 'Vitória Eletrodomésticos', 'Rua Beira Mar', 100, 'Centro', '1111-2226', '123.321.06', '94.405.385/0006-35', '00000-000');
INSERT INTO Loja VALUES (7, 7, 'GuarapaEletrodomésticos', 'Rua dos Bandeirantes', 149, 'Centro', '1111-2227', '123.321.07', '94.405.385/0007-35', '00000-000');

INSERT INTO Fornecedor VALUES (1, 4, 'LG', 'Av. Brasil', 1, 'Centro', '12000-321', 'Fábio', '94.405.385/0007-35', '123.321.07', '1234-4321');
INSERT INTO Fornecedor VALUES (2, 4, 'Nokia', 'Av. Afonso Pena', 198, 'Centro', '12000-321', 'Carlos', '94.405.385/0007-35', '123.321.07', '1234-4321');
INSERT INTO Fornecedor VALUES (3, 4, 'Gradiente', 'Av. Paraiso', 3654, 'Centro', '12000-321', 'Felipe', '94.405.385/0007-35', '123.321.07', '1234-4321');
INSERT INTO Fornecedor VALUES (4, 4, 'Philips', 'Av. Joaquim Gabriel', 24, 'Centro', '12000-321', 'Alex', '94.405.385/0007-35', '123.321.07', '1234-4321');
INSERT INTO Fornecedor VALUES (5, 4, 'Politorno', 'Av. Manoel de Nobrega', 156, 'Centro', '12000-321', 'Breno', '94.405.385/0007-35', '123.321.07', '1234-4321');
INSERT INTO Fornecedor VALUES (6, 4, 'HP', 'Rua Santa Efigênia', 1092, 'Centro', '12000-321', 'Vanessa', '94.405.385/0007-35', '123.321.07', '1234-4321');
INSERT INTO Fornecedor VALUES (7, 4, 'Brastemp', 'Av. Interlagos', 1098, 'Centro', '12000-321', 'Fábio', '94.405.385/0007-35', '123.321.07', '1234-4321');
 
INSERT INTO Produto VALUES (1, 1, 1, 'TV 50" Plasma 600Hz c/ HDMI, Conversor Digital Integrado, Entrada p/ PC e USB 50PJ350 - LG', 39.9, 3);
INSERT INTO Produto VALUES (2, 1, 4, 'DVD Player c/ karaokê, Entrada USB e DivX - DVP3520KX - Philips', 1.5, 5);
INSERT INTO Produto VALUES (3, 1, 3, 'TV 37" LCD - LCD3730 - (1366 X 768 Pixels) c/ HDTV Ready, Entrada HDMI, Widescreen e Progressive Scan - Gradiente', 3, 2);
INSERT INTO Produto VALUES (4, 2, 7, 'Refrigerador Brastemp Ative! Frost Free 403 litros BRM47', 81, 2);
INSERT INTO Produto VALUES (5, 2, 7, 'Lavadora e Secadora de Roupa 7kg Ative! BWS24 - Prata - Brastemp', 75, 2);
INSERT INTO Produto VALUES (6, 2, 1, 'Forno de Microondas Solo 30 Litros 110V Branco - LG', 15, 4);
INSERT INTO Produto VALUES (7, 3, 6, 'Notebook HP G42-245br c/ Intel® Pentium Dual Core T4500 2.3GHz 3GB 320GB DVD-RW Webcam LED 14” Windows 7 Premium - HP', 1.5, 2);
INSERT INTO Produto VALUES (8, 3, 6, 'Multifuncional Jato de Tinta Deskjet F4480 (Impressora + Copiadora + Scanner) - HP', 4.9, 4);
INSERT INTO Produto VALUES (9, 4, 1, 'LG GT360 Messenger Vermelho - GSM c/ Teclado Qwerty, Câmera 2.0MP c/ zoom 4x, Filmadora, MP3 Player, Rádio FM, Bluetooth Estéreo 2.0, Fone e Cabo de Dados', 0.6, 1);
INSERT INTO Produto VALUES (10, 4, 2, 'Smartphone Nokia N8 Prata - GSM c/ Sistema Operacional Symbian 3, Tecnologia 3G, Wi-Fi, TouchScreen, GPS, Câmera 12MP c/ lente Carl Zeiss c/ Flash Xenon e Câmera p/ Chamadas de Video, Filmadora HD c/ Saída HDMI e Som Dolby Digital, MP3 Player, Rádio FM, Bluetooth Estéreo 3.0, Cabo de Dados, Fone e Memória interna de 16GB', 0.6, 1);
INSERT INTO Produto VALUES (11, 5, 5, 'Mesa Malta Branca - Politorno', 4.9, 4);
INSERT INTO Produto VALUES (12, 5, 5, 'Mesa de Estudo Resende - Branca - Politorno', 4.9, 4);
INSERT INTO Produto VALUES (13, 5, 5, 'Cama de casal 1,60 Colônia - Castanho Escuro com Preto', 4.9, 4);

INSERT INTO Transportadora VALUES (1, 8, 'RapiTrans', 'Rua 20 de Maio', 90, 'Centro', '12000-789', '94.405.385/0007-35', '123.321.07', 'Juninho', '1234-4321');

INSERT INTO Entrada VALUES (1, 1, '02/20/2010', '03/01/2010', 1539.01, 720.00, 0000001, 153.90);
INSERT INTO Entrada VALUES (2, 1, '03/13/2010', '04/07/2010', 2984.00, 832.00, 0000002, 298.40);
INSERT INTO Entrada VALUES (3, 1, '03/28/2010', '04/14/2010', 489.00, 218.00, 0000003, 48.90);
INSERT INTO Entrada VALUES (4, 1, '04/27/2010', '04/30/2010', 3982.01, 1023.00, 0000004, 398.20);
INSERT INTO Entrada VALUES (5, 1, '05/19/2010', '05/30/2010', 1827.00, 291.00, 0000005, 182.70);
INSERT INTO Entrada VALUES (6, 1, '06/03/2010', '06/25/2010', 9812.00, 934.00, 0000006, 981.20);
INSERT INTO Entrada VALUES (7, 1, '08/01/2010', '09/01/2010', 19876.00, 1034.00, 0000007, 1987.60);
											   
INSERT INTO Saida VALUES (1, 1, 1, 300.00, 180.00, 30.00);
INSERT INTO Saida VALUES (2, 1, 1, 1073.00, 180.00, 107.30);
INSERT INTO Saida VALUES (3, 2, 1, 512.00, 250.00, 51.20);
INSERT INTO Saida VALUES (4, 3, 1, 793.00, 70.00, 79.30);
INSERT INTO Saida VALUES (5, 4, 1, 800.00, 0.00, 80.00);
INSERT INTO Saida VALUES (6, 5, 1, 296.00, 140.00, 29.60);
INSERT INTO Saida VALUES (7, 6, 1, 724.00, 92.00, 72.40);
INSERT INTO Saida VALUES (8, 7, 1, 310.00, 153.00, 31.00);

INSERT INTO ItemEntrada VALUES (1, 7, 1, 'AB0021', 30, 120.00);
INSERT INTO ItemEntrada VALUES (2, 13, 1, 'AB0022', 49, 160.00);
INSERT INTO ItemEntrada VALUES (3, 1, 1, 'AB0023', 18, 90.00);
INSERT INTO ItemEntrada VALUES (4, 4, 2, 'AB0024', 7, 300.00);
INSERT INTO ItemEntrada VALUES (5, 9, 2, 'AB0025', 21, 169.00);
INSERT INTO ItemEntrada VALUES (6, 6, 2, 'AB0026', 10, 120.00);
INSERT INTO ItemEntrada VALUES (7, 7, 2, 'AB0027', 42, 83.00);
INSERT INTO ItemEntrada VALUES (8, 11, 3, 'AB0028', 90, 187.00);
INSERT INTO ItemEntrada VALUES (9, 10, 3, 'AB0029', 9, 720.00);
INSERT INTO ItemEntrada VALUES (10, 3, 3, 'AB0030', 21, 157.00);
INSERT INTO ItemEntrada VALUES (11, 8, 4, 'AB0031', 100, 800.00);
INSERT INTO ItemEntrada VALUES (12, 2, 4, 'AB0032', 15, 174.00);
INSERT INTO ItemEntrada VALUES (13, 10, 4, 'AB0033', 61, 92.00);
INSERT INTO ItemEntrada VALUES (14, 9, 5, 'AB0034', 19, 48.00);
INSERT INTO ItemEntrada VALUES (15, 4, 6, 'AB0037', 38, 900.00);
INSERT INTO ItemEntrada VALUES (16, 1, 6, 'AB0038', 2, 120.00);
INSERT INTO ItemEntrada VALUES (17, 12, 7, 'AB0040', 83, 539.00);
INSERT INTO ItemEntrada VALUES (18, 5, 7, 'AB0041', 24, 170.00);
INSERT INTO ItemEntrada VALUES (19, 3, 7, 'AB0042', 8, 925.00);

INSERT INTO ItemSaida VALUES (1, 1, 7, 'AB0021', 16, 120.00);
INSERT INTO ItemSaida VALUES (2, 1, 13, 'AB0022', 46, 160.00);
INSERT INTO ItemSaida VALUES (3, 1, 1, 'AB0023', 16, 90.00);
INSERT INTO ItemSaida VALUES (4, 2, 4, 'AB0024', 5, 300.00);
INSERT INTO ItemSaida VALUES (5, 2, 9, 'AB0025', 20, 169.00);
INSERT INTO ItemSaida VALUES (6, 2, 6, 'AB0026', 10, 120.00);
INSERT INTO ItemSaida VALUES (7, 2, 7, 'AB0027', 38, 83.00);
INSERT INTO ItemSaida VALUES (8, 3, 11, 'AB0028', 89, 187.00);
INSERT INTO ItemSaida VALUES (9, 3, 10, 'AB0029', 9, 720.00);
INSERT INTO ItemSaida VALUES (10, 3, 3, 'AB0030', 19, 157.00);
INSERT INTO ItemSaida VALUES (11, 4, 8, 'AB0031', 89, 800.00);
INSERT INTO ItemSaida VALUES (12, 4, 2, 'AB0032', 13, 174.00);
INSERT INTO ItemSaida VALUES (13, 4, 10, 'AB0033', 57, 92.00);
INSERT INTO ItemSaida VALUES (14, 5, 9, 'AB0034', 19, 48.00);
INSERT INTO ItemSaida VALUES (15, 6, 4, 'AB0037', 38, 900.00);
INSERT INTO ItemSaida VALUES (16, 6, 1, 'AB0038', 2, 120.00);
INSERT INTO ItemSaida VALUES (17, 7, 12, 'AB0040', 80, 539.00);
INSERT INTO ItemSaida VALUES (18, 7, 5, 'AB0041', 22, 170.00);
INSERT INTO ItemSaida VALUES (19, 7, 3, 'AB0042', 5, 925.00);

-- Listagem 3. Produtos em estoque.
select p.codproduto, p.descricao, ie.qtde, s.qtde from Produto p inner join 
ItemEntrada ie on p.codproduto = ie.Produto_codproduto inner join 
ItemSaida s on p.codproduto = s.Produto_codproduto
where ie.qtde - s.qtde > 0 

-- Listagem 4. Produtos com quantidade abaixo do mínimo.
select p.codproduto, p.descricao, ie.qtde, s.qtde from Produto p inner join 
ItemEntrada ie on p.codproduto = ie.Produto_codproduto inner join 
ItemSaida s on p.codproduto = s.Produto_codproduto
where ie.qtde - s.qtde > qtdemin

-- Listagem 5. Produtos separados por fornecedor.
select Produto.codproduto, Produto.descricao, Produto.peso, Produto.qtdemin, Fornecedor.codfornecedor, Fornecedor.fornecedor from Produto
inner join Fornecedor on Produto.Fornecedor_codfornecedor = Fornecedor.codfornecedor

-- Listagem 6. tempo médio de chegada do pedido.
select avg(DATEDIFF(DAY, dataped, dataentr)) as MediaDeDias from Entrada

-- Listagem 7. Total de saída separados por loja.
select Saida.*, Loja.codloja from Saida
inner join Loja on Saida.Loja_codloja = Loja.codloja

-- Listagem 8. Listagem dos pesos de entrada e saída.
select ItemEntrada.lote as Lote, ItemEntrada.Produto_codproduto as CodigoProduto, ItemEntrada.qtde as QuantidadeEntrada,
Produto.peso as PesoUnitarioProduto, ItemEntrada.qtde * Produto.peso as PesoTotalEntrada, ItemSaida.qtde as QuantidadeSaida,
ItemSaida.qtde * Produto.peso as PesoTotalSaida
from ItemEntrada INNER JOIN ItemSaida on ItemEntrada.lote = ItemSaida.lote 
    AND ItemEntrada.Produto_codproduto = ItemSaida.Produto_codproduto
INNER JOIN Produto on ItemEntrada.Produto_codproduto = Produto.codproduto

-- Listagem 9. Total de frete gasto na entrada e saída.
select sum(Entrada.frete) + sum(Saida.frete) from Entrada
inner join Saida on Entrada.codentrada = Saida.codsaida

-- Listagem 10. Quantidade de item por categoria
select
    Categoria.categoria as Categoria,
    SUM(ItemEntrada.qtde) as QuantidadeTotalEntrada,
    SUM(ItemSaida.qtde) as QuantidadeTotalSaida,
    SUM(ItemEntrada.qtde) - SUM(ItemSaida.qtde) as QuantidadeEmEstoque
from 
    Categoria
INNER JOIN 
    Produto on Categoria.codcategoria = Produto.Categoria_codcategoria
LEFT JOIN 
    ItemEntrada on Produto.codproduto = ItemEntrada.Produto_codproduto
LEFT JOIN 
    ItemSaida on Produto.codproduto = ItemSaida.Produto_codproduto
group by 
    Categoria.categoria;


