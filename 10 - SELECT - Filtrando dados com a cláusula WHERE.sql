select a.*
  from Alunos a
 where a.nome = 'Higo Ribeiro dos Santos'

select a.*
  from Alunos a
 where a.data_nascimento >= '27/08/1997'

 -- > maior
 -- < menor
 -- >= maior ou igual
 -- <= menor ou igual
 -- <> diferente
 -- =  igual

 select a.* 
   from alunos a
  where a.sexo = 'F'

 select a.*
   from alunos a
  where a.sexo = 'M'

  select a.*
    from alunos a
   where a.sexo = 'M'
     and a.data_nascimento >= '01/01/2003'
	 and a.id_aluno > 500

  select a.nome, a.sexo, year(a.data_nascimento) ano
    from alunos a
   where a.data_nascimento >= '01/01/2003'

  select *
    from AlunosxTurmas
  
  select at.*
    from alunosxturmas at
   where at.valor > 500

select at.id_aluno, at.valor * at.valor_desconto as desconto
  from alunosxturmas at

  select at.id_aluno, at.valor * at.valor_desconto as desconto
    from alunosxturmas at
   where at.valor > 500

select floor(at.valor * at.valor_desconto) as desconto
  from AlunosxTurmas at
 where at.valor_desconto > 0
   and at.valor > 500


-- joins (JUNTAR ou UNIR)
select c.nome_curso, t.data_inicio, t.data_termino, 
       floor(at.valor) valor_bruto, floor((at.valor * at.valor_desconto)) as desconto,
	   floor(at.valor - (at.valor * at.valor_desconto)) as Valor_liquido
  from AlunosxTurmas at, Turmas t, Cursos c
 where at.id_turma = t.id_turma
   and t.id_curso = c.id_curso
   and t.id_turma = 6



