USE [master]
GO

/****** Object:  LinkedServer [SERVERNAME]    Script Date: 11/16/2021 10:05:07 AM ******/
EXEC master.dbo.sp_addlinkedserver @server = N'SERVERNAME', @srvproduct=N'SOURCE TYPE', @provider=N'MSDASQL', @datasrc=N'ODBC SOURCE NAME', @provstr=N'DRIVER=DRIVERNAME};SERVER=SERVER;Port=PORT;USER=USERNAME;PASSWORD=PASSWORD;OPTION=3;DATABASE=SERVERNAME'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SERVERNAME',@useself=N'False',@locallogin=NULL,@rmtuser=N'USERNAME',@rmtpassword='PASSWORD'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SERVERNAME',@useself=N'True',@locallogin=N'USERNAME',@rmtuser=NULL,@rmtpassword='PASSWORD'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'collation compatible', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'connect timeout', @optvalue=N'10'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'SERVERNAME', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


