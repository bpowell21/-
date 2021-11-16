@@ -0,0 +1,4 @@
select * , object_name(major_id)
from sys.extended_properties 
where NAME like 'MS_Description%'	
--and [value] not like '%lux%'