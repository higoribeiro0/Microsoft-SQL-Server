
--Apagar Tabelas; --Remove uma ou mais definições de tabela e todos os dados, índices, gatilhos, restrições e especificações de permissão dessas tabelas. 
select * from sys.tables;

select *
  into tbDELETE
  from cursos;

drop table tbdelete;

select * from tbdelete;


--Apagar Sequences; --Remove um objeto de sequência do banco de dados atual.
select * from sys.sequences;

DROP SEQUENCE seq_Teste02;


--Apagar Indices; --Remove um ou mais índices relacionais, espaciais, filtrados ou XML do banco de dados atual
CREATE INDEX indAlunosTeste ON Alunos(id_aluno);

DROP INDEX Alunos.indAlunosTeste;


--Apagar Procedures; --Remove um ou mais procedimentos armazenados ou grupos de procedimentos do banco de dados atual.
CREATE PROCEDURE prcListaAlunosTeste
AS
     SELECT al.nome, al.data_nascimento
	   FROM alunos al
	  where al.nome like 'G%';

exec prcListaAlunosTeste;

DROP PROCEDURE prcListaAlunosTeste;


--Apagar Constraints; (PK e FK)
SELECT NAME FROM SYS.key_constraints where name like 'pk%'

select *
  into tbDelete
  from cursos;
select * from tbdelete;

USE sql_db_1;
GO
ALTER TABLE tbDelete
ADD CONSTRAINT pk_idcurso UNIQUE (id_curso);

SELECT NAME FROM SYS.key_constraints where name like 'pk%'

ALTER TABLE tbDelete
 DROP CONSTRAINT pk_idcurso;


--Apagar views; --Remove uma ou mais exibições do banco de dados atual. DROP VIEW pode ser executado em exibições indexadas.
CREATE VIEW vwAlunosTurmasTeste
AS
   SELECT nome, data_nascimento, datediff(year, data_nascimento, getdate()) idade
     from alunos
	where datediff(year, data_nascimento, getdate()) < 18;

select * from vwAlunosTurmasTeste;

DROP VIEW vwAlunosTurmasTeste;


--CRIAR BANDO DE DADOS
--Apagar banco de dados; --Remove um ou mais bancos de dados de usuário ou instantâneos do banco de dados de uma instância.
CREATE DATABASE dbTesteDrop; 

DROP DATABASE dbTesteDrop;