
SELECT 
    DATE(cohort_month) AS Cohort_month,

    month_0 AS initial_users,

    coalesce(ROUND(100.0 * (month_0 + month_1 + month_2 + month_3 + month_4 + month_5)/(month_0 * 6), 2
    ), 0) AS `0 to 5 months`,

    coalesce(ROUND(100.0 * (month_6  + month_7  + month_8  + month_9 + month_10 + month_11) / (month_0 * 6), 2
    ),0) AS `6_to_11_months`,

    coalesce(ROUND(100.0 * (month_12+ month_13 + month_14  + month_15 + month_16 + month_17) / (month_0 * 6),2
    ),0) AS `12_to_17_months`,

    coalesce(ROUND(100.0 * (month_18+ month_19 + month_20 + month_21 + month_22 + month_23 ) / (month_0 * 6),2
    ),0) AS `18_to_23_months`

from `cobalt-psyche-472916-h3`.`dbt_ps`.`stg_cohort_analysis_24M`
order by cohort_month desc