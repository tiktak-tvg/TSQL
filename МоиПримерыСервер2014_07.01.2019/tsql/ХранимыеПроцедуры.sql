use NitgenAccessManager
DECLARE @Command nchar(3500) = ''

set @Command = 'SELECT * FROM SelectToTable ';


set @Command = 'NitgenAccessManager.dbo.SelectToTable'
Begin 
  EXEC sp_executesql @Command;
END

