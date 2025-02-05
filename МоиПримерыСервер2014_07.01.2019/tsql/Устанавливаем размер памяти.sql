EXEC sp_configure 'show advanced option', '1' 
RECONFIGURE WITH OVERRIDE
GO
EXEC sys.sp_configure N'min server memory (MB)', N'2384'
GO
RECONFIGURE WITH OVERRIDE
GO
EXEC sys.sp_configure N'max server memory (MB)', N'16384'
GO
RECONFIGURE WITH OVERRIDE
GO
EXEC sp_configure 'show advanced option', '0'
RECONFIGURE WITH OVERRIDE
GO