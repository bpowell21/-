SELECT DISTINCT pr.principal_id, pr.name, pr.type_desc, 
    pr.authentication_type_desc, pe.state_desc, pe.permission_name
FROM sys.database_principals AS pr
JOIN sys.database_permissions AS pe
    ON pe.grantee_principal_id = pr.principal_id
	
WHERE PR.[NAME] IN ( 'jthomsw')

--EXAMPLE:  GRANT CONTROL ON SCHEMA::BTS TO A1002831

--GRANT SELECT ON SCHEMA::CONTROLS TO jthomsw

--PERMISSIONS ON SCHEMA
SELECT state_desc
    ,permission_name
    ,'ON'
    ,class_desc
    ,SCHEMA_NAME(major_id)
    ,'TO'
    ,USER_NAME(grantee_principal_id)
FROM sys.database_permissions AS PERM
JOIN sys.database_principals AS Prin
    ON PERM.major_ID = Prin.principal_id
        AND class_desc = 'SCHEMA'
--WHERE major_id = SCHEMA_ID('gp')
ORDER BY major_id 
