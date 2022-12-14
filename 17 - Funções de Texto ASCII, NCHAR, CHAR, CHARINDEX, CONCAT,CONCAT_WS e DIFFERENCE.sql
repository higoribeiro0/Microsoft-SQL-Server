
--ASCII (Código numérico que representa os caracteres, usando uma escala decimal de 0 a 127)
select ascii('a');
select ascii('A');
select ascii('9');
select ascii('Higo'); --vai fazer a indentificação apenas do caractere a esquerda, no caso só a letra 'H'.


--NCHAR/CHAR (Converte um código Ascii do tipo 'int' em um valor de 'caracter')
select nchar(65);
select nchar(97);
select nchar(57);

select char(65);
select char(97);


--CHARINDEX (pesquisa um caractere em uma sequência de até 8.000 caracteres)/ saber a posição onde tá o caractere que busco.
select charindex('e','Ribeiro');

select charindex('e','Ribeiro', 6); --saber qual posição que eu quero buscar o caractere.
select charindex('Santos', 'Higo Ribeiro dos Santos', 1); --vai contar todos os caracteres, até chegar em 'Santos', contando qual a posição.

select * from alunos;

select a.nome, charindex('Prado', a.nome, 1)
  from alunos a;

select a.nome, charindex('Prado', a.nome, 1)
  from alunos a
  where convert(int, charindex('Prado', a.nome, 1)) > 0; --visualizar 'prado' apenas nas posições > 0

select a.nome, charindex('Prado', a.nome, 1)
  from alunos a
  where charindex('Prado', a.nome, 1) <> '0'; --visualizar 'prado' apenas diferente '<>' de 0.


--CONCAT
select concat('Higo',' ', 'Ribeiro');
select concat('Higo', ' || ', 'Ribeiro');

select 'Higo' + ' ' + 'Ribeiro';

select concat(a.nome, ' - ', c.nome_curso) "Nome do aluno - Curso"
  from alunos a
    inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	  inner join Turmas t on t.id_turma = at.id_turma
	  inner join Cursos c on c.id_curso = t.id_curso;


--CONCAT_WS (concatenar com separador)
select concat_ws(' - ','Higo', 'Ribeiro', 'dos', 'Santos');

select concat_ws(' - ', a.nome, c.nome_curso,
      'Início : ' + convert(char, t.data_inicio),
			'Término : ' + convert(char, t.data_termino))
  from alunos a
     inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;

select concat_ws(' - ', a.nome, c.nome_curso,
        'Início : ' + trim(convert(char, t.data_inicio)), --trim: elimina os espaços desnecessários.
				'Término : ' + trim(convert(char, t.data_termino)))
  from alunos a
     inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;


--DIFFERENCE (escala de 0 a 4)
select DIFFERENCE('Higo', 'Igor');
select DIFFERENCE('Higo', 'Higor');
select DIFFERENCE('Higo', 'Igo');
select DIFFERENCE('Higo', 'Vitor');
select DIFFERENCE('Higo', 'Youtube');

