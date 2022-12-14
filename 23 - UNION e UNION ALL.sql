  -- mesmo número de colunas
  -- o Uso do null para contornar limitação
  -- Nome das colunas será do primeiro select
  -- Executa um distinct quando utilizado

/* 
Concatena os resultados de duas consultas em um único conjunto de resultados. 
Você controla se o conjunto de resultados inclui linhas duplicadas:

UNION ALL – inclui duplicatas.
UNION – exclui duplicatas.
Uma operação UNION é diferente de uma JOIN :

Uma UNION concatena conjuntos de resultados de duas consultas. Mas uma UNION não cria linhas individuais com base em colunas coletadas de duas tabelas.
Uma JOIN compara colunas de duas tabelas para criar linhas de resultado compostas de colunas de duas tabelas.

A seguir são apresentadas as regras básicas de combinação dos conjuntos de resultados de duas consultas usando UNION:
O número e a ordem das colunas devem ser iguais em todas as consultas.
Os tipos de dados devem ser compatíveis.
*/

--Ele permite que junte um select com o segundo select na tabela.
 select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
   from dimproduct P
  where p.color = 'NA'

union

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
   from dimproduct P
  where p.color <> 'NA'


--IGNORAR ESSA LIMITAÇÃO

  select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, null, null
   from dimproduct P
  where p.color = 'NA'

union

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
   from dimproduct P
  where p.color <> 'NA'


--ORDEM DOS CAMPOS

  select p.SafetyStockLevel, p.EnglishProductName, p.DaysToManufacture, null, null
   from dimproduct P
  where p.color = 'NA'

union

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
   from dimproduct P
  where p.color <> 'NA'

--ALIAS PARA COLUNAS 

Select p.EnglishProductName as Produto, 
       p.SafetyStockLevel	as Estoque_Seguro, 
	   p.DaysToManufacture	as Dias_Produção, 
	   p.class				as Classe,	 
	   p.color				as Color
  from dimproduct p
 where p.color = 'NA' 
   and p.class is not null -- a classe não pode ser em branco
 
UNION

Select p.EnglishProductName Produto_nome, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
  from dimproduct p
 where color = 'Black'
   and class = 'L'

--UNION (DISTINCT) / UNION ALL (TODOS OS REGISTROS)

select englishproductname, class, color
  from dimproduct

union 

select englishproductname, class, color
  from dimproduct

order by 1