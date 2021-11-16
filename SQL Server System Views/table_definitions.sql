--alter view  dbo.table_definition as

 select  t.TABLE_SCHEMA,
  case  
	when t.table_name like 'aoms_extract%' or t.table_name = 'aoms_rpt_omi502' then 'aoms' 
	when t.table_name like 'spc_extract%' then 'spc' 
	end [src_sys]
 ,case  
	when t.table_name like 'aoms_extract%' then replace(t.table_name, 'aoms_extract_', '')
	when t.table_name like 'spc_extract%' then replace(t.table_name, 'spc_extract_', '')
	when t.table_name = 'aoms_rpt_omi502' then replace(t.table_name, 'aoms_rpt_', '')
	end [table]
 
	,table_desc


from INFORMATION_SCHEMA.TABLES t

left join (
	select 
		 object_name(major_id) table_name
		,[name] desc_cd_name
		,[value] table_desc
	from sys.extended_properties 
	where NAME like 'MS_Description%'	
	--and [value] not like '%lux%'
) xp
	on t.table_name = xp.table_name
where TABLE_SCHEMA = 'dbo' 
	and case  when t.table_name like 'aoms_extract%' then replace(t.table_name, 'aoms_extract_', '') when t.table_name like 'spc_extract%' then replace(t.table_name, 'spc_extract_', '') when t.table_name = 'aoms_rpt_omi502' then replace(t.table_name, 'aoms_rpt_', '') end is not null
	and (t.table_name like 'aoms%' or t.table_name like 'spc%')
	and (t.table_name not like '%_staging' and t.table_name not like '%_staging_%' and t.table_name not like '%backup%')
	and TABLE_TYPE <> 'VIEW'


--order by t.table_name

