
--AlteraÇÃo das caracterÍsticas dos campos de uma tabela
--Utilizado para Adicionar, Deletar ou modificar colunas de uma tabela existente
--------------------------------------------------------------------------------

SELECT *
  INTO tTEMP
  from alunos;

exec sp_columns tTemp; --SABER A DESCRIÇÃO DE CADA UMAS DAS TABELAS.


--Adicionar coluna;
SELECT * FROM TTEMP;

ALTER TABLE tTemp
  ADD cpf NUMERIC(11);

UPDATE tTemp 
   SET cpf = 11122233344 -- colocar registro na coluna
 WHERE id_aluno = 155;

UPDATE tTemp 
   SET cpf = 11122233355 
 WHERE id_aluno = 155;

ALTER TABLE tTemp
  add EMAIL varchar(100); -- colocar e-mail na coluna


--Apagar uma coluna;
ALTER TABLE tTemp
 drop column email;

select * from ttemp;


--Alterar tipo de dados de uma coluna;
ALTER TABLE TTEMP
  DROP COLUMN CPF;

ALTER TABLE ttemp
  add CPF VARCHAR(100);

EXEC SP_COLUMNS tTemp;

ALTER TABLE tTemp
ALTER COLUMN cpf NUMERIC(11);

EXEC SP_COLUMNS tTemp;

DROP TABLE TTEMP;