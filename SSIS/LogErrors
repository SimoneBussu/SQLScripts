with LogSSIS as (
SELECT DISTINCT
    A.[executable_id]
    ,[project_id]
    ,[project_version_lsn]
    ,[package_name]
    ,cast(b.start_time as datetime2) as StartTime
    ,cast(b.end_time as datetime2) as EndTime
    ,[package_location_type]
    ,[package_path_full]
    ,[executable_name]
    ,execution_result
    ,[executable_guid]
    ,[package_path]
    ,b.execution_id
FROM [SSISDB].[internal].[executables] as A
inner join [SSISDB].[internal].[executable_statistics] as B
    ON A.[executable_id] = b.[executable_id]

where 
	
	-- Select the Project ID of the SSIS
	project_id = XXX

	--Add the date from which you want to start
    and cast(b.start_time as date) > 'YYYY-MM-DD'
)
select 
    L.[project_id],
    L.package_name as PackageName,
    L.executable_name as ExecutableName,
    L.execution_result,
    L.package_path,
    LEFT(CONVERT(varchar,L.StartTime,121),10) AS Date,
    cast(L.StartTime as time) as StartTime,
    cast(L.EndTime as time) as EndTime,
    DATEDIFF(MINUTE, L.StartTime, L.EndTime) as [LoadingTime (Minutes)],
    -- Using XML PATH to concatenate error messages
    STUFF((
        SELECT ' | ' + m.message
        FROM [SSISDB].[internal].[operation_messages] m
        WHERE L.execution_id = m.operation_id
        AND m.message_type = 120  -- Error messages only
        FOR XML PATH('')
    ), 1, 3, '') as ErrorMessages
from LogSSIS L
order by L.StartTime desc
