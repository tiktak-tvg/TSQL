DECLARE @currentMaxMem int;
DECLARE @currentMinMem int;
SELECT @currentMaxMem = CAST([value] as int) FROM [master].[sys].[configurations]
WHERE NAME IN ('Max server memory (MB)')
SELECT @currentMinMem = CAST([value] as int) FROM [master].[sys].[configurations]
WHERE NAME IN ('Min server memory (MB)')

set @currentMaxMem = @currentMaxMem -512

if @currentMaxMem < @currentMinMem
begin
set @currentMaxMem = @currentMinMem +1
end

EXEC sys.sp_configure N'show advanced options', N'1' 
RECONFIGURE WITH OVERRIDE
EXEC sys.sp_configure N'max server memory (MB)', @currentMaxMem 
RECONFIGURE WITH OVERRIDE
EXEC sys.sp_configure N'show advanced options', N'0' 
RECONFIGURE WITH OVERRIDE
