CREATE DATABASE PROGRAMACAO
USE PROGRAMACAO

Begin 
	print 'oi';
end;

-- pra declarar variavel tem que usar o declare 
Declare
	@nome varchar(50) = 'HAS';
Begin
	print 'Etec' + @nome;
end;
/*
Declare
-- com um declare dá pra declarar várias variáveis mas tem que separar elas por vírgula no final pondo e vírgula
	@n1 decimal(3,1) = 10,
	@n2 decimal(3,1) = 5,
	@res decimal(3,1);
begin
-- o set é pra fazer conta 
	set @res = @n1 + @n2;
-- se colocar o print sem o cast nao vira, pq o print não concatena texto com numero
	print 'Somatoria = ' + Cast(@res as varchar);
end;
 */

Declare
	@n1 decimal(3,1) = 10,
	@n2 decimal(3,1) = 5;
Declare	
--da pra fazer isso tbm e não precisa colocar set
	@res decimal(3,1) = @n1 * @n2;
Begin
	print 'Somatória = ' + CAST(@res as varchar);
end;

-- decisao
/*
if condicao
begin 
	-codigo-
end;
*/

-- quando for coiso de decisao tem que colocar os blocos de begin e end em tudo

--exercicios


declare
	@num1 decimal(3,1) = 10,
	@num2 decimal(3,1) = 10,
	@num3 decimal(3,1) = 9,
	@num4 decimal(3,1) = 3;
declare
	@media decimal(3,1) = (@num1 + @num2 + @num3 + @num4) / 4;
begin
	 if @media >= 7
		begin
			print 'tá o crime';
		end;
	else
		begin
			print 'moiô, os bota chegô'
		end;
end;


--Exercicios BD com contas
	
	--salario mínimo mais 25%

declare
	@salmin decimal(12,2) = 1412.00;
declare	
	@pcc decimal(12,2) = @salmin + (@salmin * 0.25);
begin 
	print @pcc;
end;

	--valor dola

declare
	@dola decimal(7,2) = 45;
declare
	@cambio decimal(7,2) = @dola * 5.1;
begin
	print 'o cambio é: ' +  cast(@cambio as varchar)
end;

	--valor parcelas carro

declare
	@valtotal decimal(12,2) = 60000;
declare
	@montante decimal(12,2) = @valtotal + (@valtotal * 0.03);
declare
	@marcela decimal(12,2) = @montante / 10
begin
	print 'valor total com juros: ' +  cast(@montante as varchar)
	print 'valor parcelas: ' +  cast(@marcela as varchar)
end;

	