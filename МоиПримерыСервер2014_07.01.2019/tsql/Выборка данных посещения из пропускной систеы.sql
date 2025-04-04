  DECLARE @data_OT datetime  =  '01.04.2015' 
  DECLARE @data_DO datetime  =  '01.04.2015' 
    
  
  if OBJECT_ID('tempdb..#t1')>0 drop table  #t1
  SELECT DISTINCT 
      [UserName] 
   ,CASE WHEN TransactionTime is not NULL and  FunctionKey = 2 THEN  ''  ELSE MIN(TransactionTime) END as dP
   ,CASE WHEN TransactionTime is not NULL and  FunctionKey = 2 THEN  ''  ELSE CONVERT(VARCHAR(12),MIN(TransactionTime),4) END as prihod
   ,CASE WHEN TransactionTime is not NULL and  FunctionKey = 2 THEN  ''  ELSE CONVERT(VARCHAR(12),MIN(TransactionTime),8) END as time_prihod
  into #t1          
  FROM [NitgenAccessManager].[dbo].[ngv_AuthLog]
  WHERE FunctionKey > 0 and UserIDIndex > 0  and CAST(TransactionTime as date) between @data_OT  and @data_DO and TransactionTime is not NULL
  -- GROUP BY UserName, CONVERT(VARCHAR(12),TransactionTime,4), CONVERT(VARCHAR(12),TransactionTime,8) ,FunctionKey
  GROUP BY UserName, TransactionTime, FunctionKey
  
  if OBJECT_ID('tempdb..#t2')>0 drop table  #t2
  SELECT distinct
      [UserName] 
      ,CASE WHEN TransactionTime is not NULL and  FunctionKey = 1 THEN  ''  ELSE TransactionTime END as du
      ,CASE WHEN TransactionTime is not NULL and  FunctionKey = 1 THEN  ''  ELSE CONVERT(VARCHAR(12),MAX(TransactionTime),4) END as uhod
      ,CASE WHEN TransactionTime is not NULL and  FunctionKey = 1 THEN  ''  ELSE CONVERT(VARCHAR(12),MAX(TransactionTime),8) END as time_uhod
  into #t2      
  FROM [NitgenAccessManager].[dbo].[ngv_AuthLog]
  WHERE FunctionKey > 0 and UserIDIndex > 0  and CAST(TransactionTime as date) between @data_DO  and @data_OT and TransactionTime is not NULL
  GROUP BY UserName, TransactionTime, FunctionKey
  
  
  SELECT #t1.UserName,#t1.prihod AS DATa,isnull(#t1.time_prihod,'') AS Приход ,isnull(#t2.time_uhod,'') as Уход,
  case when #t2.time_uhod IS null then '' else CONVERT(VARCHAR(12),(#t2.du - #t1.dP),8) end as Время
  FROM #t1
  Left outer join #t2  on #t1.UserName = #t2.UserName and #t1.prihod = #t2.uhod  
  WHERE #t1.prihod <> ''
  ORDER BY #t1.UserName,#t1.prihod
  
  
  
  
  