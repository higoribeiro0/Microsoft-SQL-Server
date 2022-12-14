
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


------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @vCONTADOR INT = 1;

WHILE @vCONTADOR < 10 
BEGIN
	PRINT 'Contador : ' + convert(varchar, @vContador)
	set @vCONTADOR += 1
END;
/*
Contador : 1
Contador : 2
Contador : 3
Contador : 4
Contador : 5
Contador : 6
Contador : 7
Contador : 8
Contador : 9
Horário de conclusão: ...
*/


-- Sem o BEGIN Aninhado(ele não sabe qual a sequência que ele deve rodar essas transações)
BEGIN TRANSACTION;
IF @@TRANCOUNT = 0

	SELECT nome, nome_curso, sexo
	  FROM tTEMP 
     WHERE sexo = 'M';

ROLLBACK TRANSACTION;

PRINT 'Executar Dois Rollbacks Geraria um erro de execução do segundo';
ROLLBACK TRANSACTION;

PRINT 'Transação defeita'


--com o Begin aninhado
BEGIN TRANSACTION;
IF @@TRANCOUNT = 0
	
	BEGIN
		select nome, nome_curso, sexo from tTemp Where sexo = 'M';
		ROLLBACK TRANSACTION;
		PRINT 'Executar dois rollbacks gera um erro no segundo';
	END;
ROLLBACK TRANSACTION;

PRINT 'Transação desfeita';


DROP TABLE TTEMP;