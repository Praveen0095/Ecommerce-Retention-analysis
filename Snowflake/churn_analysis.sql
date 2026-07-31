CREATE OR REPLACE EXTERNAL TABLE retention_analysis.gold_layer.Churn_Table
  (Segment VARCHAR AS (value:Segment::string),
  churned_customers INT AS (value:Churned_customers::integer),
  total_customers INT as (value:Total_customers::integer),
  avg_monetary_churn FLOAT AS (value:Avg_Monetary_Churn::float),
  churn_rate FLOAT AS (value:Churn_rate::float))
LOCATION = @retention_analysis.gold_layer.s3_gold_stage/Churn_analysis/
FILE_FORMAT = (TYPE = PARQUET)
;

SELECT segment, churned_customers, avg_monetary_churn, churn_rate, total_customer 
FROM retention_analysis.gold_layer.Churn_Table;
