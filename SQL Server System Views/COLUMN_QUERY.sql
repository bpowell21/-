select object_name(object_id) [Table], [name], type_name(system_type_id) [type] 
,concat(',CAST( NULL AS ' ,
CASE 
    WHEN type_name(system_type_id) IN ('INT', 'BYTE', 'MONEY', 'DATE') THEN CONCAT(type_name(system_type_id), ')')
    WHEN type_name(system_type_id) IN ('NVARCHAR', 'VARCHAR') THEN CONCAT( type_name(system_type_id),'(', MAX_LENGTH,')',')')
    WHEN type_name(system_type_id) IN ('DECIMAL', 'NUMERIC', 'FLOAT') THEN CONCAT( type_name(system_type_id),'(', [PRECISION], ',', [SCALE],')',')')
    END, ' [', [NAME], ']') QUERY
from sys.columns 
where object_name(object_id) like 'asset_invoices_global_prod'
order by column_id
