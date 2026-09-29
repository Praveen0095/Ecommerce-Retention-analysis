SELECT 
    segment, quarter_period,
    metric_value as retention_rate, quarter, year
FROM {{ source('cohort_analysis_seg', 'cohort_quart_analysis') }}
