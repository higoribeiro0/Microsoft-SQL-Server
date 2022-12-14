
--Funções LTRIM(Remove o caractere de espaço ou outros caracteres especificados do início de uma cadeia de caracteres.)
select ltrim('       Higo');
select ltrim('x      Higo');

declare @varTexto varchar(50);
    set @varTexto = '      Este é um texto para teste do LTRIM';

	select ltrim(@varTexto) as Teste;
	select resultado = ltrim(@varTexto);


--Funções RTRIM (Remove o caractere de espaço ou outros caracteres especificados do final de uma cadeia de caracteres.)
select rtrim('Higo      ');

select len('Higo      ');
select len(rtrim('Higo      '));

declare @varTexto2 varchar(50);
    set @varTexto2 = 'Este é um texto para teste do RTRIM        ';

select rtrim(@varTexto2);


--Funções PATINDEX (Retorna a posição inicial da primeira ocorrência de um padrão)
select patindex('%rib%', 'Higo Ribeiro');
select patindex('%a','Terça');
select patindex('r%', 'Ribeiro');
select patindex('g%', 'Higo');

select posicao = patindex('%hr%', 'Higo Ribeiro');
select posicao = patindex('%igo_ribe%','Higo Ribeiro');


--SUBSTRING (Retorna parte de uma expressão de caractere, binária, de texto ou de imagem.)
declare @varTexto3 varchar(100);
    set @varTexto3 = 'Meu nome é Higo Ribeiro dos Santos';
select substring(@varTexto3, patindex('%Ribeiro%',@varTexto3), 7);
select patindex('%Ribeiro%',@varTexto3);


--REPLACE(Substitui todas as ocorrências de um valor da cadeia de caracteres especificado por outro valor de cadeia de caracteres.)
select replace('Higo Ribeiro', 'h', 'x');
select replace(replace('Higo Ribeiro', 'h', 'x'),'o','?');

select A.nome, a.data_nascimento, a.sexo
  from Alunos A;

select A.nome, a.data_nascimento, replace(a.sexo, 'M', 'Masculino') sexo
  from Alunos A;

declare @cpf varchar(15);
    set @cpf = '111.222.333-44';

select replace(replace(@cpf,'.',''),'-','') as CPF;


--REPLICATE(Repete um valor da cadeia de caracteres um número especificado de vezes.)
select replicate('x', 8);


--Tamanho de coluna fixo em 50 posições
--Passo 1
select * from alunos;
select len(nome) from alunos;

--Passo 2
select nome + replicate('x', 50 - len(nome)) 
  from alunos;

--Passo 3
select len(nome + replicate('x', 50 - len(nome))) as tamanho
  from alunos;

select nome + replicate(' ', 50 - len(nome))
  from alunos;


--REVERSE(Retorna a ordem inversa de um valor da cadeia de caracteres.)
select reverse('Higo Ribeiro');
select reverse(nome) from alunos;