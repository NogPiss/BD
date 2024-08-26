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
-- com um declare d� pra declarar v�rias vari�veis mas tem que separar elas por v�rgula no final pondo e v�rgula
	@n1 decimal(3,1) = 10,
	@n2 decimal(3,1) = 5,
	@res decimal(3,1);
begin
-- o set � pra fazer conta 
	set @res = @n1 + @n2;
-- se colocar o print sem o cast nao vira, pq o print n�o concatena texto com numero
	print 'Somatoria = ' + Cast(@res as varchar);
end;
 */

Declare
	@n1 decimal(3,1) = 10,
	@n2 decimal(3,1) = 5;
Declare	
--da pra fazer isso tbm e n�o precisa colocar set
	@res decimal(3,1) = @n1 * @n2;
Begin
	print 'Somat�ria = ' + CAST(@res as varchar);
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
			print 't� o crime';
		end;
	else
		begin
			print 'moi�, os bota cheg�'
		end;
end;


--Exercicios BD com contas
	
	--salario m�nimo mais 25%

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
	print 'o cambio �: ' +  cast(@cambio as varchar)
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

	

		--valor parcelas carro2.0 

declare
	@marcelaseis decimal(12,2),
    @marceladoze decimal(12,2),
	@marceladezoito decimal(12,2),
    @valortotal decimal(12,2) = 10000;
begin
	set @valortotal = @valortotal - @valortotal * 0.2;
    set @marcelaseis = (@valortotal + @valortotal * 0.1) / 6
    set @marceladoze = (@valortotal + @valortotal * 0.15) / 12
    set @marceladezoito = (@valortotal + @valortotal * 0.20) / 18
    print 'parcela do carro em 6x: ' + cast(@marcelaseis as varchar)       
    print 'parcela do carro em 12x:' + cast(@marceladoze as varchar)
    print 'parcela do carro e 18x: ' + cast(@marceladezoito as varchar)
end;

	--desconto de salario
    
declare 
	@salario decimal(12,2) = 10000;
declare
    @salarioliquido decimal(12,2);
BEGIN
	if @salario <= 1313.69 
    	begin
    		set @salarioliquido =  @salario - @salario;
    	end;
    
    if @salario >= 1313.70 and @salario <= 2625.12
    	begin
	    	set @salarioliquido = @salario - @salario * 0.15 ;
   		end;
    
    if @salario > 2625.12 
    	begin
    		set @salarioliquido =  @salario - @salario * 0.27;
 	    end;
    
   	print 'o salario liquido para o salario inserido eh: ' + cast(@salarioliquido as varchar)
end;


		--Exercicios em While

	--1. fatorial
		declare
			@numeroEscolhido decimal(12,2) = 4;
		declare
			@fatorial decimal(12,2) = @numeroEscolhido;
		declare
			@contador decimal(4) = @numeroEscolhido ;
		
		while (@contador > 1)
		begin
			set @fatorial = @fatorial * (@contador - 1);
			set @contador = @contador - 1;
		end;
		begin
			print 'o fatorial do numero escolhido e: ' + cast(@fatorial as varchar)
		end
	
	--2. 

	--3
	--4

