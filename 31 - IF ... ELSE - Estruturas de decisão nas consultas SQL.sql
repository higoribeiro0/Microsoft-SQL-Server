
DROP TABLE TTEMP;
select * INTO tTEMP FROM ALUNOS;

IF 10 > 20 
   select '10 é maior que 20'
ELSE
   SELECT '10 é menor que 20';

IF DATENAME(weekday, getdate()) IN ('Sábado', 'Domingo')
   SELECT 'Estamos no fim de semana. Hoje é ' + DATENAME(weekday, getdate())
ELSE
   SELECT 'Estamos em um dia de semana. Hoje é ' + DATENAME(weekday, getdate());


--Variáveis Globais do SQL:
SELECT @@SERVERNAME; --ver o nome do meu servidor.
SELECT @@LANGUAGE; -- ver a linguagem do meu ambiente.
SELECT @@LANGID; --id da linguagem.
SELECT @@TRANCOUNT; --mostra a transação que está ativa.


IF @@LANGUAGE <> 'Português (Brasil)'
   SELECT 'Today is ' + datename(weekday, getdate())
ELSE
   SELECT 'Hoje é ' + datename(weekday, getdate());

IF OBJECT_ID('dbo.Alunos','U') is null
   SELECT 'Esta tabela não existe!'
ELSE
   EXEC sp_columns Alunos;

/*
você pode ter visto o código Transact-SQL que transmite cadeias de caracteres usando um prefixo N. 
Isso indica que a sequência subsequente está em Unicode (o N realmente significa conjunto de 
caracteres do idioma nacional). O que significa que você está passando um valor 
NCHAR, NVARCHAR ou NTEXT, em oposição a CHAR, VARCHAR ou TEXT.

Prefixo constantes da cadeia de caracteres Unicode com a letra N. Sem o prefixo N, a cadeia é 
convertida na página de códigos padrão do banco de dados. Esta página de código padrão pode 
não reconhecer certos caracteres.
*/

DECLARE @vIdadeMax INT;
DECLARE @vParam    INT;
    SET @vIdadeMax = 17;
	SET @vParam = 25;

IF @vIdadeMax >= @vParam
	SELECT NOME, DATA_NASCIMENTO, DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) IDADE
	  FROM tTEMP
	 WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) >= @vIdadeMax
	 ORDER BY 3 ASC
ELSE
	SELECT NOME, DATA_NASCIMENTO, DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) IDADE
	  FROM tTEMP
	 WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) < @vIdadeMax
	 ORDER BY 3 ASC;


DROP TABLE tTEMP