select 
    st.name [Table],
    sc.name [Column],
    sep.[value] [Description]
	,ROW_NUMBER() over (partition by st.name,sc.name,sep.[value] order by st.name,sc.name,sep.[value]) rn
from sys.tables st
inner join sys.columns sc on st.object_id = sc.object_id
left join sys.extended_properties sep 
	on st.object_id = sep.major_id
    and sc.column_id = sep.minor_id
    --and sep.name = 'MS_Description'
where st.name like '%MBEW%'    
	--and sep.[value] is null
					--= 'UCHKZ'
order by sc.name

	/*Select * 
,object_name(major_id)
from  sys.extended_properties*/