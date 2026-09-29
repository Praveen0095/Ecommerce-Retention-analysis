SELECT
    user_id,
    Recency,
    Frequency,
    Monetary,
    AOV,
    r_score AS R_Score,
    f_score AS F_Score,
    m_score AS M_Score,
    Segment
    
FROM {{ source('rfm_analysis', 'RFM_analysis_LTV') }}