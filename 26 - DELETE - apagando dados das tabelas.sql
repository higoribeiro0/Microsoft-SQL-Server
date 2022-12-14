
--Apagar TODOS os dados de uma tabela
--Apagar dados selecionados 
---------------------------------------------------------------------------------------------------------------------
Select *
  into dbo.tbDELETE
  FROM dbo.cursos;

DELETE FROM dbo.tbDELETE;

SELECT * FROM tbDELETE;
  DROP TABLE tbDELETE;

--Pode ser '=' ou 'like'
DELETE FROM dbo.tbDELETE 
 WHERE nome_curso like '%Avançado%'; --Excluir da tabela a palavra que tem o nome 'avançado' do 'nome_curso'.

DELETE FROM dbo.tbDELETE 
 WHERE nome_curso = 'VBA I'; -- Excluir apenas do 'nome_curso' o 'VBA I'.

----------------------------------------------------------------------------------------------------------------------
--criando uma tabela temporária
select *
  INTO AlunosTemp
  FROM Alunos;
select * from AlunosTemp;


--Apagar os alunos que não estão em nenhum curso
--Opção 1:
SELECT A.Nome, a.sexo, t.valor --Os alunos que estão registrados nos cursos
  FROM AlunosTemp A
       INNER JOIN AlunosxTurmas T on T.id_aluno = A.id_aluno;
select * from alunostemp; --638 registros

DELETE FROM AlunosTemp -- não apaga o id_aluno, só que está fora dele.
 WHERE id_aluno not in --não esteja(não apagar esses que coloquei)
 (
	SELECT a.id_aluno
  	  FROM AlunosTemp A
           INNER JOIN AlunosxTurmas T on T.id_aluno = A.id_aluno
 );


--Opção 2: Mostra os alunos que não estão registrados em nenhuma turma.
SELECT A.Nome, A.sexo
  FROM AlunosTemp A
 WHERE A.id_aluno not in -- não esteja
	(
		select t.id_aluno from AlunosxTurmas t where a.id_aluno = t.id_aluno
	)

DROP TABLE alunostemp;

select *
  INTO AlunosTemp
  FROM Alunos;


--identificar os registros;
SELECT nome,
       datediff(year, data_nascimento, getdate()) as idade,
	   a.sexo
  FROM Alunostemp a
 WHERE datediff(year, data_nascimento, getdate()) > 30 
 ORDER BY 2;

DELETE FROM AlunosTemp --Apagar os registros
 WHERE datediff(year, data_nascimento, getdate()) > 30; --Apagar todos os registros de alunos que tenham mais de 30 anos

DELETE FROM AlunosTemp --Query unificada (Deletando o (year, data_nascimento, getdate() da tabela)
 WHERE ID_ALUNO IN 
     (
		SELECT ID_ALUNO
		  FROM Alunostemp a
		 WHERE datediff(year, data_nascimento, getdate()) > 20
	 );

SELECT * FROM ALUNOSTEMP;

DROP TABLE ALUNOSTEMP;

