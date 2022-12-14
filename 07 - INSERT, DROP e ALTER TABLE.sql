CREATE TABLE AlunosxTurmas
(
   id_turma int NOT NULL, 
   id_aluno int NOT NULL,
   valor numeric(13,2) NOT NULL,
   valor_desconto numeric(3,2) NOT NULL,
   data_cadastro datetime NOT NULL,
   login_cadastro varchar(15) NOT NULL
);

ALTER TABLE AlunosxTurmas
    ADD CONSTRAINT fk_turma FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma);

ALTER TABLE AlunosxTurmas
    ADD CONSTRAINT fk_aluno FOREIGN KEy (id_aluno) REFERENCES Alunos(id_aluno);

--Apagar coluna desnecessária da tabela TURMAS

ALTER TABLE Turmas
DROP CONSTRAINT fk_alunos;

ALTER TABLE Turmas
DROP COLUMN id_aluno;

ALTER TABLE Turmas
DROP COLUMN Valor_Turma;

ALTER TABLE Turmas
DROP COLUMN Desconto;