SELECT
    value:user_id::INTEGER AS user_id,
    value:Recency::INTEGER AS Recency,
    value:Frequency::INTEGER AS Frequency,
    value:Monetary::FLOAT AS Monetary,
    value:AOV::FLOAT AS AOV,
    value:r_score::INTEGER AS R_Score,
    value:f_score::INTEGER AS F_Score,
    value:m_score::INTEGER AS M_Score,
    value:Segment::STRING AS Segment
    
FROM {{ source('gold_stage', 'rfm_analysis') }}
