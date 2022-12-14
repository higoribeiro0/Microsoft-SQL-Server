
/*TRIGGER: é estrutura do banco de dados que funciona, como o nome sugere, como uma função que é disparada mediante alguma ação. 
Geralmente essas ações que disparam os triggers são alterações nas tabelas por meio de operações de inserção, exclusão e atualização de dados 
(insert, delete e update).
*/

CREATE TABLE tbSaldos
(
	PRODUTO			VARCHAR(10),
	SALDO_INICIAL	NUMERIC(10),
	SALDO_FINAL		NUMERIC(10),
	DATA_ULT_MOV	DATETIME
);
GO


INSERT INTO tbSaldos (Produto, saldo_inicial, saldo_final, data_ult_mov)
     VALUES ('Produto A', 0, 100, getdate());
GO


CREATE TABLE tbVendas
(
	ID_VENDAS	INT,
	PRODUTO		VARCHAR(10),
	QUANTIDADE	INT,
	DATA		DATETIME
);
GO


CREATE SEQUENCE seq_tbVendas
	AS NUMERIC
	START WITH 1
	INCREMENT BY 1;


CREATE TABLE tbHistoricoVendas
(
	PRODUTO		VARCHAR(10),
	QUANTIDADE	INT,
	DATA_VENDA	DATETIME
);
GO


CREATE TRIGGER trg_AjustaSaldo
ON tbVendas
FOR INSERT
AS
BEGIN
	DECLARE @QUANTIDADE		INT,
	        @DATA			DATETIME,
			@PRODUTO		VARCHAR(10)
	
	SELECT @DATA = DATA, @QUANTIDADE = QUANTIDADE, @PRODUTO = PRODUTO from INSERTED

	UPDATE tbSaldos
	   SET saldo_final = saldo_final - @QUANTIDADE,
	       DATA_ULT_MOV = @DATA
	 WHERE PRODUTO = @PRODUTO;

	INSERT INTO tbHistoricoVendas (PRODUTO, QUANTIDADE, DATA_VENDA)
	     VALUES (@produto, @quantidade, @data);
END;
GO


INSERT INTO tbVendas (id_vendas, produto, quantidade, data)
     values (NEXT VALUE FOR seq_tbVendas, 'Produto A', 11, getdate());

select * from tbVendas;
select * from tbSaldos;
select * from tbHistoricoVendas;


DROP TABLE tbSaldos;
DROP TABLE tbVendas;
DROP TABLE tbHistoricoVendas;

DROP SEQUENCE seq_tbVendas;