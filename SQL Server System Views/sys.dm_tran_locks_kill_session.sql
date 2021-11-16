SELECT  DB_ID(),db_name(), *
FROM sys.dm_tran_locks  
--WHERE resource_database_id = DB_ID()
  --and OBJECT_name(resource_associated_entity_id) is  not null
  --AND resource_associated_entity_id = OBJECT_ID(N'data_mart.bts.invoices_global');

