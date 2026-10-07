SELECT 
    Segment, 
    total_customers AS Customer_Volume, 
    churned_customers AS Churned_customer, 
    churn_rate AS Churn_Rate,
    avg_monetary_churn
FROM `cobalt-psyche-472916-h3`.`dbt_ps`.`stg_Churn_analysis`
ORDER BY churn_rate DESC