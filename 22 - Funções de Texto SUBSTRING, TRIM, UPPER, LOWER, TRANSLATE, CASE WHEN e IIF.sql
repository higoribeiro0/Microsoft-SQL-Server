
--SUBSTRING (Retorna parte de uma expressão de caractere, binário, texto ou imagem.)
select substring('Higo Ribeiro',1, 10) as Nome;

select a.nome, substring(a.nome, 1, 20) nome_parcial
  from Alunos a;
  
--DOIS PRIMEIROS NOMES
--CASE / WHEN
/*
A expressão CASE simples compara uma expressão com um conjunto de expressões simples para determinar o resultado.
A expressão CASE pesquisada avalia um conjunto de expressões boolianas para determinar o resultado.
*/
select a.nome,
     case substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome)+1))
	      when '' then
	          a.nome
		  else
		      substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome)+1))
	 end as nome_extraido
  from Alunos a;


--IIF (Retorna um de dois valores, dependendo de a expressão booliana ser avaliada como true ou false.)
-- teste lógico na minha query.
select a.nome,
       iif(substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome) +1))  = '', --verificar se vai retornar vazio, ele busca se tem 2 nomes, se 'sim' ele retona completo,
	       a.nome,
		   substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome) +1)))  --se nao, ele vai fazer a busca da minha tabela aluno.
  from alunos a;


--TRANSLATE (Retorna a cadeia de caracteres fornecida como um primeiro argumento, após a conversão de alguns caracteres especificados no segundo argumento em um conjunto de caracteres de destino especificado no terceiro argumento.)
select translate('2*[3+4]/{7-2}','[]{}','()()');  --Resultado: 2*(3+4)/(7-2)
select translate('abcdefghi', 'abc', '123')   --Resultado: 123defghi


--REPLACE (Substitui todas as ocorrências de um valor da cadeia de caracteres especificado por outro valor de cadeia de caracteres.)
declare @vOperacao varchar(13);
    set @vOperacao = '2*[3+4]/{7-2}';
select replace(
               replace(
						replace(
								replace(@vOperacao, '[','('),
								']',')'),
						'{','('),
				'}',')');
--Resultado:  2*(3+4)/(7-2)


--TRIM (Remove o caractere de espaço ou outros caracteres especificados do início e final de uma cadeia de caracteres.)
select trim('Higo Ribeiro       '); -- Higo Ribeiro      .
select trim('         Higo           Ribeiro       '); -- Higo           Ribeiro
select trim('         SQL           SERVER     |'); -- SQL           SERVER     |


--while - Define uma condição para a execução repetida de uma instrução ou um bloco de instruções SQL. 
declare @vString varchar(100);
    set @vstring = 'SQL           Server      |';
  while charindex('  ', @vString) > 0
  begin
        set @vString = replace(@vString, '  ', ' ')
  end
  select @vString;
  --Resultado: SQL Server |


--UPPER -converter a string para maiúsculas.
--LOWER - ajuda a converter todas as letras da string dada para minúsculas.
select a.nome, upper(a.nome) as Maiúsculo, lower(a.nome) as Minúsculo
  from Alunos a;
                        --nome                                Maiúsculo                         Minúsculo
--Resultado: |Alessandro Henrique Peres Porfirio	|ALESSANDRO HENRIQUE PERES PORFIRIO	|alessandro henrique peres porfirio|