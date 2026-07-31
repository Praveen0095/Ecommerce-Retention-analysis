SELECT 
    Segment,
    churned_customers,
    total_customer,
    avg_monetary_churn,
    churn_rate
FROM {{ source('gold_stage', 'churn_table') }}
ORDER BY churn_rate DESC
