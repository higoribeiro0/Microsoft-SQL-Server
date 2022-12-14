
--Total de Turmas por curso
Select c.id_curso, c.nome_curso, count(t.id_turma) Total_Turmas
  from dbo.turmas t
       inner join dbo.cursos c on c.id_curso = t.id_curso 
 group by c.id_curso, c.nome_curso;


 --Todos os cursos, independente se há ou não turmas
 --ANSI
 select c.nome_curso, count(t.id_turma) Total_Turmas
   from dbo.turmas t
        right join dbo.cursos c on c.id_curso = t.id_curso
  group by c.nome_curso;


  --CUIDADO SE NÃO FIZER A LIGAÇÃO DOS DADOS
 select c.* 
   from dbo.turmas t, 
        dbo.cursos c

 select c.NOME_CURSO, COUNT(T.ID_TURMA)
   from dbo.turmas t, 
        dbo.cursos c
 where c.id_curso = t.id_curso
 group by c.nome_curso


 --Lista completa de alunos
 Select C.nome_curso, AT.VALOR, AT.valor_desconto, T.data_inicio, T.data_termino,
        A.nome, A.Sexo
   from AlunosxTurmas AT
        inner join dbo.turmas T on T.id_turma = AT.id_turma
		inner join dbo.cursos C on C.id_curso = t.id_curso
		inner join dbo.alunos A on A.id_aluno = AT.id_aluno
          

--Quantidade de Turmas com alunos
select C.nome_curso, T.id_turma, count(1) Total
  from dbo.Turmas T
       inner join AlunosxTurmas AT on AT.id_turma = t.id_turma
	   inner join cursos C on C.id_curso = T.id_curso
group by  c.nome_curso, t.id_turma
