SELECT sj.name as JobName,
       sh.run_date as RunDate,
          sh.run_status as RunStatusCode, /*1 = Success; 0 = Failure */
          SH.step_id as StepID,
       sh.step_name as StepName,
          SH.message as StepMessage,
       STUFF(STUFF(RIGHT(REPLICATE('0', 6) +  CAST(sh.run_time as varchar(6)), 6), 3, 0, ':'), 6, 0, ':') as 'RunTime',
       STUFF(STUFF(STUFF(RIGHT(REPLICATE('0', 8) + CAST(sh.run_duration as varchar(8)), 8), 3, 0, ':'), 6, 0, ':'), 9, 0, ':') as 'Run Duration (DD:HH:MM:SS)  '
FROM msdb.dbo.sysjobs sj
JOIN msdb.dbo.sysjobhistory sh
ON sj.job_id = sh.job_id
