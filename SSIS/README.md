# SSIS Scripts

In this folder, I share scripts that I use to detect anomalies, find error messages, collect more detailed information on packages' executions, and other SSIS monitoring tasks.

## Prerequisites

- SQL Server 2016 or newer
- Access to SSISDB catalog
- ssis_admin role or equivalent permissions

## Available Scripts

| Script Name | Description |
|-------------|-------------|
| ssis_detailed_execution_log.sql | Provides comprehensive execution details for specific SSIS packages, including package components, execution times, duration metrics, and consolidated error messages for troubleshooting. |
| sql_agent_job_history.sql | Displays a complete overview of SQL Agent job history with formatted execution times, run status, step details, and duration in a readable DD:HH:MM:SS format. |

