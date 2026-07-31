{{ config(
    materialized="table",
    
) }}
    SELECT
    Cohort_month,

    period_0 as Initial_users,

    round(
    100.0 * (period_0 + period_1 + period_2 + period_3 + period_4 + period_5) 
    / nullif(period_0 * 6, 0), 
    2
    ) as "0 to 5 months",    

    round(
    100.0 * (period_6 + period_7 + period_8 + period_9 + period_10 + period_11 )
    / nullif(period_0 * 6, 0), 
    2
    ) as "6 to 11 Months",

    round(
    100.0 * (period_12 + period_13 + period_14 + period_15 + period_16 + period_17 )
    / nullif(period_0 * 6, 0), 
    2) as "12 to 17 Months",

    round(
    100.0 * (period_18 + period_19 + period_20 + period_21 + period_22 + period_23 + period_24 )
    / nullif(period_0 * 6, 0), 
    2) as "18 to 24 Months",
    
    FROM {{ ref('stg_cohort_analysis_24M') }}
    order by Cohort_month DESC
