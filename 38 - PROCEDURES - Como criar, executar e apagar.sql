
--Procedures - Conjuntos de comandos SQLs que podem ser executados de uma só vez.
CREATE PROCEDURE BuscaCurso
       @NomeCurso VARCHAR(20)
AS
SET @NOMECURSO = '%' + @NomeCurso + '%';
SELECT c.id_curso, c.nome_curso, a.nome, isnull(a.sexo,'NI') sexo
  FROM Cursos C
       INNER JOIN Turmas t on (t.id_turma = c.id_curso)
	   INNER JOIN AlunosXTurmas alt on (alt.id_turma = t.id_turma)
	   INNER JOIN Alunos a on (a.id_aluno = alt.id_aluno)
 WHERE nome_curso like @NomeCurso;

 exec BuscaCurso 'Powerpoint'; --exibir os alunos que fazem esse curso.
 exec BuscaCurso 'Excel'; --exibir os alunos que fazem esse curso.
 exec BuscaCurso '%'; --exibir todos os alunos que fazem todos os cursos.


--Procedure com retorno
 CREATE PROCEDURE IncluirNovoCurso
     @NomeCurso		VARCHAR(100),
	 @LoginCadastro VARCHAR(100)
AS
BEGIN
	DECLARE @vIdCurso INT;
	SELECT @vIdCurso = max(id_curso) + 1 from cursos;
	INSERT INTO cursos (id_curso, nome_curso, data_cadastro, login_cadastro)
	     VALUES (@vIdCurso, @NomeCurso, getdate(), @LoginCadastro);
    SELECT @vIdCurso = id_curso from cursos where id_curso = @vIdCurso;
	SELECT @vIdCurso as retorno;
END;
GO

exec IncluirNovoCurso 'VBA I', 'HIGORIBEIRO';

select * from cursos order by id_curso desc;

DELETE FROM cursos where id_curso in (23, 22); --APAGAR O CÓDIGO 23 E 22.

