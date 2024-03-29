 select distinct --* 
	 TABLE_CATALOG + '.' + TABLE_SCHEMA	[SCHEMA]
	,TABLE_NAME
	,COUNT(COLUMN_NAME) [COLS_COUNT]

from INFORMATION_SCHEMA.columns
where TABLE_SCHEMA = 'oracle'
GROUP BY 
	 TABLE_CATALOG + '.' + TABLE_SCHEMA	
	,TABLE_NAME
order by TABLE_NAME


