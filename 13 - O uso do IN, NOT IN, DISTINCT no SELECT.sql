
--Total de Turmas por Curso
select c.id_curso, c.nome_curso, count(t.id_turma) as Total_turma
  from dbo.Turmas t 
       inner join dbo.cursos c on c.id_curso = t.id_curso
Group By c.id_curso, c.nome_curso;


--Tirar a prova da quantidade de turmas por curso
select *
  from dbo.turmas
 where id_curso = 1; --VBA I

 select *
   from dbo.turmas
  where id_curso = 5; --Excel Intermediário


--Utilizar a cláusula IN
select *
  from dbo.turmas
 where id_curso in (1, 5);


 --Utilizar a cláusula NOT IN
select *
  from dbo.turmas
 where id_curso not in (1, 5);


--Ano de nascimento dos alunos
--DISTINCT
select DISTINCT DATEPART(YEAR, data_nascimento) ANO
  from dbo.alunos
 order by 1 ASC; --Crescente

select DISTINCT DATEPART(YEAR, data_nascimento) AS ANO
  from dbo.alunos
 order by 1 DESC; --decrescente


 --Lista completa de alunos
 SELECT c.id_curso,
        c.nome_curso,
		at.valor,
		at.valor_desconto,
		t.data_inicio,
		t.data_termino,
		a.nome,
		a.sexo
   from alunosxturmas AT
       inner join dbo.turmas T on (t.id_turma = at.id_turma)
	   inner join dbo.cursos C on (c.id_curso = t.id_curso)
	   inner join dbo.alunos A on (a.id_aluno = at.id_aluno)
order by 2, a.sexo;

SELECT c.id_curso,
        c.nome_curso,
		at.valor,
		at.valor_desconto,
		t.data_inicio,
		t.data_termino,
		a.nome,
		a.sexo
   from alunosxturmas AT
       inner join dbo.turmas T on (t.id_turma = at.id_turma)
	   inner join dbo.cursos C on (c.id_curso = t.id_curso)
	   inner join dbo.alunos A on (a.id_aluno = at.id_aluno)
  where a.sexo = 'M'
order by 2, a.sexo;