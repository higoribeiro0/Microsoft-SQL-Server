select * from TURMAS --Select para todos os registros da tabela Turmas
select * from Cursos

select * from dbo.Turmas -- * Todos os registros

--Exemplo de Query utilizando o nome da tabela
select turmas.* from turmas

--Selecionar apenas alguns campos da tabela
select id_turma, id_curso, data_inicio
  from dbo.turmas

--Utilizar Alias (APELIDO) para Nome da Tabela
Select *
  from dbo.Turmas T

select cc.* from dbo.cursos CC

Select t.*
  from dbo.turmas T

Select T.id_turma, T.id_curso, t.data_inicio
  from dbo.turmas T

--Utilizar Nomes Personalizados para nossos campos
Select T.id_curso AS IDC, t.id_turma AS IDT, T.data_inicio AS "DATA COMEÇO"
  from dbo.turmas T

--Segunda forma
Select tt.id_curso IDC, tt.id_turma IDT, tt.data_inicio "DATA COMEÇO"
  from dbo.turmas TT

