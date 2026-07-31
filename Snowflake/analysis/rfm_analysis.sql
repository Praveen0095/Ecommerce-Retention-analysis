CREATE OR REPLACE EXTERNAL TABLE retention_analysis.gold_layer.rfm_analysis
(
 user_id INT as (value:user_id::integer),
 Recency INT AS (value:Recency::integer),
 Frequency INT AS (value:Frequency::integer),
 Monetary FLOAT as (value:Monetary::float),
 AOV FLOAT AS (value:AOV::float),
 R_Score INT as (value:r_score::integer),
 F_Score INT as (value:f_score::integer),
 M_Score INT as (value:m_score::integer),
 Segment VARCHAR AS (value:Segment::string)
 
)
LOCATION = @retention_analysis.gold_layer.s3_gold_stage/RFM_analysis/
FILE_FORMAt = (TYPE = PARQUET)
AUTO_REFRESH =FALSE;

SELECT user_id,recency,frequency,monetary,AOV,r_score,f_score,m_score,segment from retention_analysis.gold_layer.rfm_analysis
ORDER BY recency 
LIMIT 10;
