SELECT
    Segment,
    Customer_Volume,
    Order_Volume,
    Amount_Spent,
    AOV,
    LTV
FROM {{ source('customer_segments_analysis', 'Customer_Segment') }}
