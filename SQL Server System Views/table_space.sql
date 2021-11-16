--CREATE TABLE #SpaceUsed (
--	 TableName sysname
--	,NumRows BIGINT
--	,ReservedSpace VARCHAR(50)
--	,DataSpace VARCHAR(50)
--	,IndexSize VARCHAR(50)
--	,UnusedSpace VARCHAR(50)
--	) 

--DECLARE @str VARCHAR(500)
--SET @str =  'exec sp_spaceused ''?'''
--INSERT INTO #SpaceUsed 
--EXEC sp_msforeachtable @command1=@str

SELECT TableName, NumRows, 
   cast(CONVERT(numeric(18,0),REPLACE(ReservedSpace,' KB','')) / 1024 as decimal(18,2) )		as ReservedSpace_MB,
   cast(CONVERT(numeric(18,0),REPLACE(DataSpace,' KB','')) / 1024 as decimal(18,2) )				as DataSpace_MB,
   cast(CONVERT(numeric(18,0),REPLACE(IndexSize,' KB','')) / 1024 as decimal(18,2) )					as IndexSpace_MB,
   cast(CONVERT(numeric(18,0),REPLACE(UnusedSpace,' KB','')) / 1024 as decimal(18,2) )			as UnusedSpace_MB,

   cast(CONVERT(numeric(18,0),REPLACE(ReservedSpace,' KB',''))  as decimal(18,2) )		as ReservedSpace_KB,
   cast(CONVERT(numeric(18,0),REPLACE(DataSpace,' KB',''))  as decimal(18,2) )				as DataSpace_KB,
   cast(CONVERT(numeric(18,0),REPLACE(IndexSize,' KB',''))  as decimal(18,2) )					as IndexSpace_KB,
   cast(CONVERT(numeric(18,0),REPLACE(UnusedSpace,' KB',''))  as decimal(18,2) )			as UnusedSpace_KB,

      cast(CONVERT(numeric(18,0),REPLACE(ReservedSpace,' KB',''))  as decimal(18,2) ) * 0.000001		as ReservedSpace_GB,
   cast(CONVERT(numeric(18,0),REPLACE(DataSpace,' KB',''))  as decimal(18,2) )	* 0.000001				as DataSpace_GB,
   cast(CONVERT(numeric(18,0),REPLACE(IndexSize,' KB',''))  as decimal(18,2) )	* 0.000001					as IndexSpace_GB,
   cast(CONVERT(numeric(18,0),REPLACE(UnusedSpace,' KB',''))  as decimal(18,2) )	* 0.000001			as UnusedSpace_GB
FROM #SpaceUsed
ORDER BY ReservedSpace_MB desc