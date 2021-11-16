SELECT *,@@SPID FROM sys.dm_pdw_exec_sessions
 where not sql_spid = @@SPID
	and  login_name = 'A1002831'
	and [app_name] like '%query%'