use EsencialVerde

declare @start datetime2
declare @end datetime2

set @start = SYSDATETIME()
select * from dbo.productosventaDin
set @end = SYSDATETIME()

SELECT DATEDIFF_BIG(NANOSECOND, @start, @end) AS NanosecondsDiff

--declare @start datetime2
--declare @end datetime2

set @start = SYSDATETIME()
select * from dbo.ProductosVenta
set @end = SYSDATETIME()

SELECT DATEDIFF_BIG(NANOSECOND, @start, @end) AS NanosecondsDiff