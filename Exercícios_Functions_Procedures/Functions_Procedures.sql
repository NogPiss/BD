create database TrabalhoBD
use TrabalhoBD

CREATE TABLE Clientes (
    clienteid INT NOT NULL,
    nome_cliente VARCHAR(30) NOT NULL,
    cidade VARCHAR(30),
    datacad DATE,
    PRIMARY KEY (clienteid)
);

CREATE TABLE Pedidos (
    pedidoid INT NOT NULL,
    cliente_clienteid INT NOT NULL,
    datapedido DATE,
    valortotal NUMERIC(12, 2),
    descaplicado numeric(12,2),
    PRIMARY KEY (pedidoid),
    FOREIGN KEY (cliente_clienteid) REFERENCES Clientes(clienteid)
);

CREATE TABLE Produtos (
    produtoid INT NOT NULL,
    nome_produto VARCHAR(30) NOT NULL,
    categoria_produto VARCHAR(30),
    preco_produto NUMERIC(12, 2),
    PRIMARY KEY (produtoid)
);

CREATE TABLE ItensPedidos (
    itemid INT NOT NULL,
    pedidos_pedidoid INT NOT NULL,
    produtos_produtoid INT NOT NULL,
    quantidade INT,
    preco_unitario NUMERIC(12, 2),
    PRIMARY KEY (itemid),
    FOREIGN KEY (pedidos_pedidoid) REFERENCES Pedidos(pedidoid),
    FOREIGN KEY (produtos_produtoid) REFERENCES Produtos(produtoid)
);

-- Inserir dados na tabela Clientes
INSERT INTO Clientes (clienteid, nome_cliente, cidade, datacad)
VALUES
(1, 'João Silva', 'São Paulo', '2024-01-15'),
(2, 'Maria Oliveira', 'Rio de Janeiro', '2024-02-20'),
(3, 'Carlos Santos', 'Belo Horizonte', '2024-03-05');

-- Inserir dados na tabela Produtos
INSERT INTO Produtos (produtoid, nome_produto, categoria_produto, preco_produto)
VALUES
(10, 'Produto A', 'Categoria 1', 100.00),
(11, 'Produto B', 'Categoria 2', 200.00),
(12, 'Produto C', 'Categoria 1', 150.00);

-- Inserir dados na tabela Pedidos
INSERT INTO Pedidos (pedidoid, cliente_clienteid, datapedido, valortotal, descaplicado)
VALUES
(1001, 1, '2024-04-10', 1500.00, 'Desconto de 10% aplicado'),
(1002, 2, '2024-04-15', 2000.00, 'Desconto de 5% aplicado'),
(1003, 3, '2024-04-20', 1200.00, 'Nenhum desconto aplicado');

-- Inserir dados na tabela ItensPedidos
INSERT INTO ItensPedidos (itemid, pedidos_pedidoid, produtos_produtoid, quantidade, preco_unitario)
VALUES
(1, 1001, 10, 3, 100.00),
(2, 1001, 12, 2, 150.00),
(3, 1002, 11, 5, 200.00),
(4, 1003, 12, 1, 150.00);

go

--Exercício 1 - Consulta Clientes

alter procedure ConsultaClientes
as
BEGIN
	select c.nome_cliente, c.cidade, 
	sum(p.valortotal) as TotalGasto,
	(SELECT TOP 1 pr.nome_produto
	from Produtos pr
	join ItensPedidos ipe on pr.produtoid = ipe.produtos_produtoid
	order by ipe.preco_unitario * ipe.quantidade DESC) as ProdutoMaisCaro
	from Clientes c
	inner join Pedidos p on c.clienteid = p.cliente_clienteid
	where valortotal > 5000 and DATEDIFF(MONTH, datapedido, GETDATE()) <= 3
	group by c.nome_cliente, c.cidade;
END;

go

EXEC ConsultaClientes

--Exercício 2

go 

go

create procedure AplicaDesconto
as
Begin

	begin transaction

	Update Pedidos
	set descaplicado = CASE
		When TotalItens > 30 and pedidos.valortotal <= (TotalItens * 10) Then 0.15
		When TotalItens > 20 and pedidos.valortotal <= (TotalItens * 10) Then 0.10
		When TotalItens > 10 and pedidos.valortotal <= (TotalItens * 10) Then 0.05
	ELSE 0.00
	END
	FROM(
		SELECT p.pedidoid, count(i.itemid) as TotalItens, p.valortotal from Pedidos p
		inner join ItensPedidos i on p.pedidoid = i.pedidos_pedidoid
		where datapedido >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)
		and datapedido < DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) +1, 0)
		GROUP BY p.pedidoid, p.valortotal
	) AS SubQuery
	where Pedidos.pedidoid = SubQuery.pedidoid

	commit transaction
end;

go

exec AplicaDesconto

-- Exercício 3

go 

create or alter procedure interacao_produtos
as
begin
	select * from Produtos p
	inner join ItensPedidos ped on ped.produtos_produtoid = p.produtoid 

	select * from Produtos p 
	left join ItensPedidos ped on ped.produtos_produtoid = p.produtoid
	where ped.produtos_produtoid is null
end;

exec interacao_produtos

go