SELECT 
    Segment, 
    total_customers AS Customer_Volume, 
    churned_customers AS Churned_customer, 
    churn_rate AS Churn_Rate,
    avg_monetary_churn
FROM {{ref('stg_Churn_analysis')}}
ORDER BY churn_rate DESC