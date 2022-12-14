
SELECT x.*
  INTO tTemp 
  FROM (
		 select row_number() over( order by id_aluno) linha, 
		        y.id_aluno, y.nome, y.sexo, y.nome_curso, y.data_inicio, y.data_termino, y.valor
		   from (
		 select  a.id_aluno, a.nome, a.sexo, c.nome_curso, t.data_inicio, t.data_termino, at.valor
			from alunosxturmas at
				 inner join turmas t on (t.id_turma = at.id_turma)
				 inner join cursos c on (c.id_curso = t.id_curso)
 				 inner join alunos a on (a.id_aluno = at.id_aluno) ) y
	   ) x;

select * from tTemp;


--Exemplo 1:
--Tabela não existe
BEGIN TRY
	select * from tempTable;
END TRY
BEGIN CATCH
	SELECT 
	       ERROR_NUMBER() as Número_erro,
		   ERROR_MESSAGE() as Mensagem_erro;
END CATCH;


--Exemplo 2:
--Utilizando em uma procedure:
CREATE PROCEDURE prc_Exemplo
AS
	select * from tempTable;
GO

BEGIN TRY
	execute prc_Exemplo;
END TRY
BEGIN CATCH
	SELECT
	       ERROR_NUMBER() AS Numero_erro,
		   ERROR_MESSAGE() as Mensagem_erro;
END CATCH;


--Exemplo 3:
BEGIN
	BEGIN TRY
		  SELECT 1/0;
	END TRY
	BEGIN CATCH
		PRINT 'Erro número   : ' + convert(varchar, error_number());
		PRINT 'Erro mensagem : ' + error_message();
		PRINT 'Erro severiry : ' + convert(varchar, error_severity());
		PRINT 'Erro state    : ' + convert(varchar, error_state());
		PRINT 'Erro line     : ' + convert(varchar, error_line());
		PRINT 'Erro proc     : ' + error_procedure();
	END CATCH;
END
/* Mensagem:
(0 linhas afetadas)
Erro número   : 8134
Erro mensagem : Erro de divisão por zero.
Erro severiry : 16
Erro state    : 1
Erro line     : 3

Horário de conclusão: ...
*/