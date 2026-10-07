SELECT 
    Segment,
    churned_customers,
    total_customers,
    avg_monetary_churn,
    churn_rate
from `cobalt-psyche-472916-h3`.`Churn_analysis`.`Churn_analysis_table`
ORDER BY churn_rate DESC