select object_name(object_id) [Table], [name], type_name(system_type_id) [type] --*
from sys.columns 
where object_name(object_id) like 'asset_bts_invoices_%'
and [name] in (
				select distinct [name]
				from sys.columns 
				where object_name(object_id) like 'asset_bts_invoices_%'
				group by  [name]
				having count(distinct type_name(system_type_id)) > 1)
and [name] like 'Table%'
order by [name] , object_name(object_id)

