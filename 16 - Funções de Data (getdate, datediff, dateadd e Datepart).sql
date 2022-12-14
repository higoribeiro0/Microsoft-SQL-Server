
--Tipos de Data e Hora no T-SQL (Transact-SQL)
--Datetime      - a partir de 01/01/1753 - Armazena até centésimos de segundos
--SmallDateTime - a partir de 01/01/1900 - Armazena até segundos

--Funções: GetDate, DatePart, DateAdd e DateDiff
--unidades: year, month, day

--GETDATE()
select getdate();

select convert(char, getdate(), 103); --Formato dd/mm/yyyy
select convert(char, getdate(), 102); --Formato aaaa.mm.dd
select convert(char, getdate(), 3) ; --Tabela ANSI SQL

select day(getdate()) as dia;
select month(getdate()) as mês;
select year(getdate()) as ano;
select year('11/11/1972') as ano;


--DATEPART (Esta função é usada para encontrar uma determinada parte da data especificada.)
select DATEPART(year, getdate());
select datepart(month, getdate());
select datepart(day, getdate());

select datepart(year, '11/11/1972');

select datepart(year, data_nascimento) as ano from dbo.Alunos
select distinct datepart(year, data_nascimento) as ano from dbo.Alunos
select distinct datepart(year, data_nascimento) as ano from dbo.Alunos order by 1


--DATEADD (é usada para somar uma hora ou um intervalo de data para uma data especificada e, em seguida, retorna a data modificada.)
select dateadd(year, -2, getdate()); --subtrai dois anos da data atual
select convert(date, dateadd(year, -2, getdate()));

select dateadd(month, 3, getdate());  --soma 3 meses a data atual
select convert(date, dateadd(month, 3, getdate()));

select dateadd(day, 28, getdate()); -- soma 28 dias a data atual
select convert(date, dateadd(day, 28, getdate()));

select dateadd(hour, 3, getdate()); -- soma 3 horas a mais

select convert(datetime, dateadd(hour, 3, getdate()));
select convert(smalldatetime, dateadd(hour, 3, getdate()));

select convert(datetime, dateadd(hour, 3, getdate())) as DateT,
    convert(smalldatetime, dateadd(hour, 3, getdate())) as SmallD


--DATEDIFF (Determina quantos intervalos de tempo especificados existem entre duas datas. )
select datediff(year, getdate(), dateadd(year, 4, getdate())) as anos;
select datediff(month, getdate(), dateadd(year, 2, getdate())) as meses;
select datediff(day, getdate(), dateadd(year, 3, getdate())) as dias;

select datediff(hour, '11/11/1972', getdate()) as horas_vida;
select datediff(minute, '11/11/1972', getdate()) as "minutos vida";
select datediff(second, '11/11/1972', getdate()) as segundos_vida;