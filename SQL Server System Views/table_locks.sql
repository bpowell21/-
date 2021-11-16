Select db_name(resource_database_id) [database_name],* from sys.dm_pdw_nodes_tran_locks
where 	db_name(resource_database_id) = 'PriceDataWarehouse'
	--and resource_type = 'object'


Select * from sys.dm_pdw_lock_waits
where [object_name] = 'controls.asset_orders_aoms'
