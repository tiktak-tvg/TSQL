SELECT 
    DB_NAME(database_id) AS [DatabaseName],
    SUM(CAST(size_in_bytes AS DECIMAL(18,2)) / POWER(1024, 3)) AS [CacheSize_GB]
FROM sys.dm_exec_cached_plans
CROSS APPLY sys.dm_exec_query_plan(plan_handle)
GROUP BY database_id
ORDER BY [CacheSize_GB] DESC;
