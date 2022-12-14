
--PARA CALCULAR A SOMA DA TABELA INTEIRA POR CURSO(VALOR TOTAL DOS ESTUDANTES MATRICULADOS POR CURSO)
SELECT t.id_turma, c.nome_curso, sum(AT.VALOR) AS TOTAL
   FROM AlunosxTurmas AT
         INNER JOIN DBO.Turmas t on t.id_turma = at.id_turma
         INNER JOIN DBO.Cursos c on c.id_curso = t.id_curso
   GROUP BY t.id_turma, c.nome_curso


--(LUCRO TOTAL) valor total somando todos os cursos
SELECT sum(v.TOTAL) FROM (
                        SELECT t.id_turma, c.nome_curso, sum(AT.VALOR) AS TOTAL
                        FROM AlunosxTurmas AT
                           INNER JOIN DBO.Turmas t on t.id_turma = at.id_turma
                           INNER JOIN DBO.Cursos c on c.id_curso = t.id_curso
                        GROUP BY t.id_turma, c.nome_curso
) v


--COUNT (Para saber quantos alunos tem na turma)
SELECT t.id_turma, COUNT(AT.id_aluno) AS total_alunos
   FROM AlunosxTurmas AT
         INNER JOIN DBO.Turmas t on t.id_turma = at.id_turma
   GROUP BY t.id_turma


--AVG/Average(Média) - Calcular a média
SELECT t.id_turma, c.nome_curso, AVG(AT.VALOR) AS TOTAL
   FROM AlunosxTurmas AT
         INNER JOIN DBO.Turmas t on t.id_turma = at.id_turma
         INNER JOIN DBO.Cursos c on c.id_curso = t.id_curso
   GROUP BY t.id_turma, c.nome_curso


--MAX(Maior valor pago)
SELECT t.id_turma, c.nome_curso, max(AT.VALOR) AS Máximo
   FROM AlunosxTurmas AT
         INNER JOIN DBO.Turmas t on t.id_turma = at.id_turma
         INNER JOIN DBO.Cursos c on c.id_curso = t.id_curso
   GROUP BY t.id_turma, c.nome_curso


--MIN(Menor valor pago)
SELECT t.id_turma, c.nome_curso, min(AT.VALOR) AS Mínimo
   FROM AlunosxTurmas AT
         INNER JOIN DBO.Turmas t on t.id_turma = at.id_turma
         INNER JOIN DBO.Cursos c on c.id_curso = t.id_curso
   GROUP BY t.id_turma, c.nome_curso


-- MAX e MIN(Na mesma tabela)
SELECT t.id_turma, c.nome_curso, min(AT.VALOR) AS Mínimo, max(AT.VALOR) AS Máximo
   FROM AlunosxTurmas AT
         INNER JOIN DBO.Turmas t on t.id_turma = at.id_turma
         INNER JOIN DBO.Cursos c on c.id_curso = t.id_curso
   GROUP BY t.id_turma, c.nome_curso



