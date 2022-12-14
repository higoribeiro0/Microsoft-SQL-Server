
SELECT x.*
  INTO tTemp 
  FROM (
		 select row_number() over( order by id_aluno) linha, 
		        y.id_aluno, y.nome, y.sexo, y.nome_curso, y.data_inicio, y.data_termino, y.valor
		   from (
		 select  a.id_aluno, a.nome, a.sexo, c.nome_curso, t.data_inicio, t.data_termino, at.valor
			from alunosxturmas at
				 inner join turmas t on (t.id_turma = at.id_turma)
				 inner join cursos c on (c.id_curso = t.id_curso)
 				 right join alunos a on (a.id_aluno = at.id_aluno) ) y --'right' pega todas as informações.
	   ) x;

SELECT * FROM TTEMP;

--Exemplo 1:
select t.id_aluno, a.data_cadastro, sum(isnull(t.valor,0)) valor
  from tTemp t 
       inner join alunos a on a.id_aluno = t.id_aluno
 group by t.id_aluno, a.data_cadastro
   having sum(isnull(t.valor,0)) > 0;

CREATE INDEX idx_tTemp on tTemp(id_aluno);
CREATE INDEX idx_Alunos on Alunos(data_cadastro);

DROP INDEX ttemp.idx_tTemp;
DROP INDEX Alunos.idx_Alunos;
DROP TABLE ttemp;


--CONSULTE UM DBA
CREATE [ UNIQUE ] [ CLUSTERED | NONCLUSTERED ] INDEX index_name
    ON <object> ( column [ ASC | DESC ] [ ,...n ] )
    [ INCLUDE ( column_name [ ,...n ] ) ]
    [ WHERE <filter_predicate> ]
    [ WITH ( <relational_index_option> [ ,...n ] ) ]
    [ ON { partition_scheme_name ( column_name )
         | filegroup_name
         | default
         }
    ]
    [ FILESTREAM_ON { filestream_filegroup_name | partition_scheme_name | "NULL" } ]
  
[ ; ]
  
<object> ::=
{ database_name.schema_name.table_or_view_name | schema_name.table_or_view_name | table_or_view_name }

<relational_index_option> ::=
{
    PAD_INDEX = { ON | OFF }
  | FILLFACTOR = fillfactor
  | SORT_IN_TEMPDB = { ON | OFF }
  | IGNORE_DUP_KEY = { ON | OFF }
  | STATISTICS_NORECOMPUTE = { ON | OFF }
  | STATISTICS_INCREMENTAL = { ON | OFF }
  | DROP_EXISTING = { ON | OFF }
  | ONLINE = { ON | OFF }
  | RESUMABLE = { ON | OFF }
  | MAX_DURATION = <time> [MINUTES]
  | ALLOW_ROW_LOCKS = { ON | OFF }
  | ALLOW_PAGE_LOCKS = { ON | OFF }
  | OPTIMIZE_FOR_SEQUENTIAL_KEY = { ON | OFF }
  | MAXDOP = max_degree_of_parallelism
  | DATA_COMPRESSION = { NONE | ROW | PAGE }
     [ ON PARTITIONS ( { <partition_number_expression> | <range> }
     [ , ...n ] ) ]
}

<filter_predicate> ::=
    <conjunct> [ AND <conjunct> ]

<conjunct> ::=
    <disjunct> | <comparison>

<disjunct> ::=
        column_name IN (constant ,...n)

<comparison> ::=
        column_name <comparison_op> constant

<comparison_op> ::=
    { IS | IS NOT | = | <> | != | > | >= | !> | < | <= | !< }

<range> ::=
<partition_number_expression> TO <partition_number_expression>

