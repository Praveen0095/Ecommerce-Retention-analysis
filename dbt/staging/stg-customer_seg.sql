SELECT
    value:Segment::STRING AS Segment,
    value:Customer_Volume::INTEGER as Customer_Volume,
    value:Order_Volume::INTEGER AS Order_Volume,
    value:Amount_Spent::FLOAT AS Amount_Spent,
    value:AOV::FLOAT AS Average_Order_Value,
    value:LTV::FLOAT AS Life_Time_Value
FROM {{ source('gold_stage', 'customer_segment') }}
