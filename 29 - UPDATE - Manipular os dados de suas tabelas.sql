
--Alteração dos dados armazenado em uma tabela
-----------------------------------------------------------------------------------------------------------------------------------
select * --Criar a tabela
  into tbTemp 
  from alunos;
select * from tbtemp;

update tbTemp
   set sexo = 'M';
   select * from tbtemp;

drop table tbtemp

select *
  into tbTemp 
  from alunos;

select * from tbTemp where sexo is null;

update tbTemp --Apenas 6 campos estão null (391,392 e 393)
   set sexo = 'F' --De 210 a 215 vai ser sexo 'F'
 where id_aluno between 210 and 215;
select * from tbTemp where sexo is null;

update tbTemp  
   set sexo = 'M' --o sexo vai mudar para 'M'
 where id_aluno in (391, 392, 393)
   and sexo is null;
   select * from tbTemp where sexo is null;

update tbTemp  --Apenas 391 é nulo
   set sexo = null
 where id_aluno = 391;
 select * from tbTemp where sexo is null;


 UPDATE tbTemp  
    SET SEXO = LOWER(SEXO), --minúsculo
	    NOME = UPPER(NOME) --maiúsculo
 WHERE ID_ALUNO BETWEEN 200 AND 290; --de 200 até 290 o sexo vai ficar minúsculo e o nome maiúsculo.

 SELECT * FROM TBTEMP 
  WHERE ID_ALUNO BETWEEN 190 AND 300;


UPDATE TBTEMP SET SEXO = UPPER(SEXO), NOME = UPPER(NOME);
DROP TABLE TBTEMP;


