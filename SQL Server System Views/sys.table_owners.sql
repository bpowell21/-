SELECT    schemas.name [Schema], o.name [Table]
  ,USER_NAME(o.principal_id) AS [Table_Owner], o.parent_object_id
, CONCAT('ALTER AUTHORIZATION ON OBJECT::[controls].[', o.name ,'] TO A1002831')
,*
FROM    sys.objects o     
left join sys.schemas 
	on o.schema_id=schemas.schema_id 
WHERE   schemas.name = 'controls'  
	--=AND o.parent_object_id <> 0
	--and o.name = 'aoms_acct_cust_typ'
order by o.name