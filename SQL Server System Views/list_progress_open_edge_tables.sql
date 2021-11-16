Select *
from openquery("AOMS",
'Select top 5 * from sysprogress.systables
where tbl like ''%audit%''
')