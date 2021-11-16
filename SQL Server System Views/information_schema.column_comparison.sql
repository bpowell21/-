 Select * from (
 
 select distinct --* 
	 TABLE_CATALOG + '.' + TABLE_SCHEMA	[SCHEMA]
	,TABLE_NAME
	,COLUMN_NAME
	,ORDINAL_POSITION 
	,DATA_TYPE
	--,CHARACTER_MAXIMUM_LENGTH 
	--,IS_NULLABLE	
	,NUMERIC_PRECISION
	,NUMERIC_SCALE
	,DATETIME_PRECISION
	,1 [SumCol]
from INFORMATION_SCHEMA.columns
where TABLE_NAME in ('v_bts_invoice_data_spc_aoms', 'v_bts_invoice_data_sap_wuxi', 'v_bts_invoice_data_sap_sdc', 'v_bts_invoice_data_sap_apac_3pt_d3', 'v_bts_invoice_data_oracle_fep10', 'v_bts_invoice_data_mfgpro', 'v_bts_invoice_data_iscala')
	--and COLUMN_NAME = 'intercompany'
) df

pivot (sum([SumCol]) for  TABLE_NAME in ([v_bts_invoice_data_spc_aoms], [v_bts_invoice_data_sap_wuxi], [v_bts_invoice_data_sap_sdc], [v_bts_invoice_data_sap_apac_3pt_d3], [v_bts_invoice_data_oracle_fep10], [v_bts_invoice_data_mfgpro], [v_bts_invoice_data_iscala])
) pvt
order by ORDINAL_POSITION


