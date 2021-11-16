SELECT sdest.DatabaseName 
    ,sdes.session_id
    ,sdes.[host_name]
	,cast(dateadd(hour, -1, sdes.last_request_start_time ) as varchar(255))  start_time 
	,cast(dateadd(hour, -1, sdes.last_request_end_time	 ) as varchar(255))  end_time	
	,cast(iif(dateadd(hour, -1, sdes.last_request_end_time)= dateadd(hour, -1, sdes.last_request_start_time), '00:00:00',
	dateadd(hour, -1, sdes.last_request_end_time) -	 dateadd(hour, -1, sdes.last_request_start_time)) as time) runtime	
    ,sdes.nt_domain
    ,sdes.nt_user_name
    ,sdec.client_net_address
    ,sdec.local_net_address
    ,sdest.ObjName
    ,sdest.Query
    ,sdes.[program_name]
    ,sdes.client_interface_name
    ,sdes.login_name
    ,sdes.login_time
FROM sys.dm_exec_sessions AS sdes
INNER JOIN sys.dm_exec_connections AS sdec ON sdec.session_id = sdes.session_id
CROSS APPLY (
    SELECT db_name(dbid) AS DatabaseName
        ,object_id(objectid) AS ObjName
        ,ISNULL((
                SELECT TEXT AS [processing-instruction(definition)]
                FROM sys.dm_exec_sql_text(sdec.most_recent_sql_handle)
                FOR XML PATH('')
                    ,TYPE
                ), '') AS Query

    FROM sys.dm_exec_sql_text(sdec.most_recent_sql_handle)
    ) sdest
where sdes.session_id <> @@SPID 
	--and sdes.login_name in ('DataAnalytic') --, 'controls')
	--and cast(dateadd(hour, -1, sdes.last_request_start_time ) as varchar(255)) like '%9:%'
ORDER BY sdes.login_name, sdec.session_id