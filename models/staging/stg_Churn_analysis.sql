SELECT 
    Segment,
    churned_customers,
    total_customers,
    avg_monetary_churn,
    churn_rate
from {{ source('Churn_analysis_seg', 'Churn_analysis_table') }}
ORDER BY churn_rate DESC
