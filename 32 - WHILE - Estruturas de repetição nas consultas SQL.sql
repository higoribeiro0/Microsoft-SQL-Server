
SELECT * INTO tTEMP FROM ALUNOS;
SELECT * FROM tTEMP;


--Substituição de valor com o While:
DECLARE @vSTRING VARCHAR(100);
    SET @vSTRING = 'SQL          Server         |';

 WHILE CHARINDEX('  ', @vSTRING) > 0 
 BEGIN
       SET @vSTRING = REPLACE(@vSTRING, '  ', ' ')
 END

 SELECT @vSTRING;


---------------------------------------------------------------------------------------------------------------------------------------------------
 DECLARE @vCONT INT;
     SET @vCONT = 1; --onde começa

WHILE (@vCONT <= 10)
BEGIN
     PRINT 'O contador está em : ' + convert(varchar,@vCONT)
	   SET @vCONT = @vCONT + 1
END;

/*
O contador está em : 1
O contador está em : 2
O contador está em : 3
O contador está em : 4
O contador está em : 5
O contador está em : 6
O contador está em : 7
O contador está em : 8
O contador está em : 9
O contador está em : 10

Horário de conclusão: ...
*/


-----------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @vCONT1 INT;
    SET @vCONT1 = 1;

WHILE (@VCONT1 <= 10)
BEGIN
      PRINT 'O contador está em : ' + CONVERT(VARCHAR, @vCONT1)
	  IF @vCONT1 = 7
	     BREAK 
	  SET @vCONT1 = @vCONT1 + 1
END

/*
O contador está em : 1
O contador está em : 2
O contador está em : 3
O contador está em : 4
O contador está em : 5
O contador está em : 6
O contador está em : 7

Horário de conclusão: ...
*/


---------------------------------------------------------------------------------------------------------------------------------------------------
--Números impares e pares:
DECLARE @vCONT2 INT;
    SET @vCONT2 = 1;

WHILE (@vCONT2 <= 17)
BEGIN
     IF @vCONT2 % 2 = 1 --resto da minha divisão por 2. (0 e 1) caso troque o 1 por 0, ele fica impar.
	 BEGIN
		SET @vCONT2 = @vCONT2 + 1
		CONTINUE
	 END
	 PRINT 'O valor é : ' + CONVERT(VARCHAR, @vCONT2)

	 SET @vCONT2 = @vCONT2 + 1
END;

DROP TABLE tTEMP;

/*
O valor é : 2
O valor é : 4
O valor é : 6
O valor é : 8
O valor é : 10
O valor é : 12
O valor é : 14
O valor é : 16

Horário de conclusão: ...
*/


-----------------------------------------------------------------------------------------------------------------------------------------------------
--Ler registros em uma tabela
SELECT x.*
  INTO tTemp 
  FROM (
		 select row_number() over(order by id_aluno) linha, 
		        y.id_aluno, y.nome, y.nome_curso, y.data_inicio, y.data_termino 
		   from (
				 select  a.id_aluno, a.nome, c.nome_curso, t.data_inicio, t.data_termino
					from alunosxturmas at
						 inner join turmas t on (t.id_turma = at.id_turma)
						 inner join cursos c on (c.id_curso = t.id_curso)
 						 inner join alunos a on (a.id_aluno = at.id_aluno)
				 ) y
	   ) x


DECLARE @Contador INT,
        @MaxLinhas INT,
		@CursoProcura NVARCHAR(100),
		@CursoNome    NVARCHAR(100),
		@NomeAluno    NVARCHAR(100)
   SET @CursoProcura = 'Excel'; --quais os alunos fazem o curso word.

SELECT @Contador = MIN(linha), @MaxLinhas = MAX(linha) from tTemp;
WHILE(@contador is not null and @contador <= @MaxLinhas)
BEGIN
	SELECT @CursoNome = nome_curso, @NomeAluno = nome 
	  FROM tTemp
	 WHERE linha = @Contador
		if CHARINDEX(@cursoprocura, @cursoNome) > 0
		   PRINT CONVERT(VARCHAR, @Contador) + '> Curso: ' + @CursoNome + ' Aluno : ' + @NomeAluno
     SET @contador = @contador + 1
END;