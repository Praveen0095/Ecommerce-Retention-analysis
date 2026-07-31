CREATE OR REPLACE EXTERNAL TABLE retention_analysis.gold_layer.customer_segment
( Segment VARCHAR as (value:Segment::string),
  Customer_Volume INT as (value:Customer_Volume::integer),
  Order_Volume INT as (value:Order_Volume::integer),
  Amount_Spent FLOAT As (value:Amount_Spent::float),
  AOV FLOAT AS (value:AOV::float),
  LTV FLOAT as (value:LTV::float)
)
LOCATION = @retention_analysis.gold_layer.s3_gold_stage/Customer_segment/
FILE_FORMAT = (TYPE = PARQUET)
AUTO_REFRESH = FALSE;

