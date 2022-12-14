
--SPACE(Retorna uma cadeia de caracteres de espaços repetidos.)
select 'Higo' + space(25);
select 'Higo' + space(25) + 'x';

declare @vNome varchar(50);
    set @vNome = 'Higo Ribeiro';
 select @vnome + space(50 - len(@vnome));

select A.nome + space(60 - len(A.nome)) + A.sexo
  from Alunos A;

select A.nome + space(60 - len(A.nome)) + A.sexo, len(nome + space(60 - len(A.NOME)) + a.sexo)
  from Alunos A;


--STRING_AGG
--Concatena os valores das expressões de cadeia  de caracteres e coloca os valores do separador entre eles. 
--O separador não é adicionado ao final da cadeia de caracteres.
--OBS: Os valores Nulls não são exibidos.

--vai exibir todos os sexos do alunos 
select string_agg(convert(nvarchar(max),sexo), ',') as registro
  from alunos;

--substitui o sexo 'n' por nulo.
select string_agg(convert(nvarchar(max), isnull(sexo,'N')), '-') as registro
  from alunos;

-- Para exibir apenas o sexo dos alunos, por ano.
select datepart(year, data_nascimento) as ano, 
      string_agg(convert(nvarchar(max), isnull(sexo,'0')),'-') as registro
  from Alunos
 group by datepart(year, data_nascimento)
 order by 1;


 --within
 select datepart(year, data_nascimento) as ano, 
        string_agg(convert(nvarchar(max), isnull(sexo, '0')),'-') 
		    within group (order by datepart(year, data_nascimento) asc) as registro
   from Alunos
  group by datepart(year, data_nascimento);


  --STUFF(Subistitui uma string de caracter 'char', a partir de uma posição pré determinada. )
  select stuff('abcdefghi',3,5,'12345'); --ele pega a terceira posição e substitui o cdefg por 12345.

  declare @vProcura varchar(50);
  declare @vSubstit varchar(30);
      set @vProcura = 'Eu, xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, autorizo ... ';
	  set @vSubstit = 'Higo Ribeiro'
  select stuff(@vProcura,5,30,@vsubstit + space(30 - len(@vSubstit)));     --Resultado: Eu, Higo Ribeiro                  , autorizo ... 
  select stuff(@vProcura,5,30,trim(@vsubstit + space(30 - len(@vSubstit)))) as termo;    --Resultado; Eu, Higo Ribeiro, autorizo ... 
