CREATE OR REPLACE EXTERNAL TABLE retention_analysis.gold_layer.cohort_table_24M
(   Cohort_month DATE AS (TO_DATE(value:"cohort_month"::string)),
    period_0 INT AS (ZEROIFNULL(value:"0"::INT)),
    period_1 INT AS (ZEROIFNULL(value:"1"::INT)),
    period_2 INT AS (ZEROIFNULL(value:"2"::INT)),
    period_3 INT AS (ZEROIFNULL(value:"3"::INT)),
    period_4 INT AS (ZEROIFNULL(value:"4"::INT)),
    period_5 INT AS (ZEROIFNULL(value:"5"::INT)),
    period_6 INT AS (ZEROIFNULL(value:"6"::INT)),
    period_7 INT AS (ZEROIFNULL(value:"7"::INT)),
    period_8 INT AS (ZEROIFNULL(value:"5"::INT)),
    period_9 INT AS (ZEROIFNULL(value:"5"::INT)),
    period_10 INT AS (ZEROIFNULL(value:"10"::INT)),
    period_11 INT AS (ZEROIFNULL(value:"11"::INT)),
    period_12 INT AS (ZEROIFNULL(value:"12"::INT)),
    period_13 INT AS (ZEROIFNULL(value:"13"::INT)),
    period_14 INT AS (ZEROIFNULL(value:"14"::INT)),
    period_15 INT AS (ZEROIFNULL(value:"15"::INT)),
    period_16 INT AS (ZEROIFNULL(value:"16"::INT)),
    period_17 INT AS (ZEROIFNULL(value:"17"::INT)),
    period_18 INT AS (ZEROIFNULL(value:"18"::INT)),
    period_19 INT AS (ZEROIFNULL(value:"19"::INT)),
    period_20 INT AS (ZEROIFNULL(value:"20"::INT)),
    period_21 INT AS (ZEROIFNULL(value:"21"::INT)),
    period_22 INT AS (ZEROIFNULL(value:"22"::INT)),
    period_23 INT AS (ZEROIFNULL(value:"23"::INT)),
    period_24 INT AS (ZEROIFNULL(value:"24"::INT))
)
LOCATION = @retention_analysis.gold_layer.s3_gold_stage/cohort_table/cohort_24M/
FILE_FORMAT = (TYPE = PARQUET)
AUTO_REFRESH = FALSE;

SELECT * FROM retention_analysis.gold_layer.cohort_table_24m  
ORDER BY Cohort_month ASC;
