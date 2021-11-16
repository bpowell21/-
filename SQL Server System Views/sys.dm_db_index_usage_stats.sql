SELECT 
	 OBJECT_NAME(OBJECT_ID) AS TableName 
	,object_id	
	,convert(varchar, dateadd(hour, -1, last_user_update), 100) actual_last_user_update
	,last_user_update
	,OBJECT_NAME(database_id) database_name	
	,database_id
	,OBJECT_NAME(index_id)	index_name
	,index_id
	,user_seeks	
	,user_scans	
	,user_lookups	
	,user_updates	
	,last_user_seek	
	,last_user_scan	
	,last_user_lookup	
	,last_user_update	
	,system_seeks	
	,system_scans	
	,system_lookups	
	,system_updates	
	,last_system_seek	
	,last_system_scan	
	,last_system_lookup	
	,last_system_update

FROM sys.dm_db_index_usage_stats
where OBJECT_NAME(OBJECT_ID) is not null



