
DROP TABLE TTEMP;

SELECT X.*
  INTO tTEMP
  FROM(
		SELECT ROW_NUMBER() OVER (ORDER BY ID_ALUNO) AS LINHA, -- row number: número de linhas
			   Y.ID_ALUNO, Y.NOME, Y.SEXO, Y.NOME_CURSO, Y.DATA_INICIO, Y.DATA_TERMINO, Y.VALOR --tabela y
		  FROM (     
				SELECT a.id_aluno, a.nome, a.sexo,
					   c.nome_curso, 
					   t.data_inicio, t.data_termino, 
					   at.valor
				  FROM AlunosxTurmas at
					   INNER JOIN turmas t on (t.id_turma = at.id_turma)
					   INNER JOIN cursos c on (c.id_curso = t.id_curso)
					   INNER JOIN alunos a on (a.id_aluno = at.id_aluno)
				) Y -- fim tabela y  
        ) X
SELECT * FROM tTEMP;


SELECT ID_ALUNO,NOME,
       CASE SEXO -- o que ela vai analisar primeiro
	        WHEN 'M' THEN 'Masculino'
			WHEN 'F' THEN 'Feminino'
	   ELSE 'Verifique' END as SEXO,
	   NOME_CURSO
  FROM tTEMP;


--Checagem de sexo:
select x.* from (
				SELECT ID_ALUNO,NOME,
					   CASE SEXO
							WHEN 'M' THEN 'Masculino'
							WHEN 'F' THEN 'Feminino'
					   ELSE 'Verifique' END as SEXO,
					   NOME_CURSO
 				  FROM tTEMP
			 ) x
 where sexo = 'Verifique';


------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT nome, nome_curso, valor, convert(date, data_inicio) dt_inicio,
       CASE year(data_inicio)
	        WHEN 2019 THEN 'Ano Anterior'
			WHEN 2020 THEN 'Ano Atual'
			WHEN 2021 THEN 'Próximo ano'
	   ELSE 'Ano inválido' END análise_ano
  from tTEMP;


------------------------------------------------------------------------------------------------------------------------------------------------------
select nome, data_nascimento, datediff(year, data_nascimento, getdate()) idade,
       CASE 
	       WHEN datediff(year, data_nascimento, getdate()) < 18 THEN 'Menor de Idade'
		   WHEN datediff(year, data_nascimento, getdate()) >=18 THEN 'Maior de Idade'
	   END Status_idade
  from Alunos;


-----------------------------------------------------------------------------------------------------------------------------------------------------
select nome, nome_curso, sexo
  from tTemp
 order by   
       CASE sexo WHEN 'F' THEN 'Feminino'
	             WHEN 'M' THEN 'Masculino'
	   ELSE 
	             'sexo' end asc; -- 'asc'ordem crescente, decrescente 'desc'.

DROP TABLE tTemp;



