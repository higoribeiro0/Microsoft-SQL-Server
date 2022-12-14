
CREATE PROCEDURE IncluirNovoCursoComValidacao
       @NomeCurso		varchar(100),
	   @LoginCadastro	varchar(100)
AS
BEGIN
	DECLARE @vIdCurso	    int;
	DECLARE @vExisteCurso	int;

	SELECT @vExisteCurso = id_curso from cursos where nome_curso = @NomeCurso;

	IF @vExisteCurso > 0 
		BEGIN
			SELECT 'O curso já existe! Gravaçãoo não realizada' as retorno
		END
	ELSE
		BEGIN
			SELECT @vIdCurso = max(id_curso) + 1 from cursos;
			INSERT INTO cursos (id_curso, nome_curso, data_cadastro, login_cadastro)
			     VALUES (@vIdCurso, @NomeCurso, getdate(), @LoginCadastro);
			SELECT @vIdCurso = id_curso from cursos where id_curso = @vIdCurso;
			SELECT @vIdCurso as retorno;
		END
END;
GO

EXEC IncluirNovoCursoComValidacao 'WebScraping', 'MRODRIGUES';


select * from cursos