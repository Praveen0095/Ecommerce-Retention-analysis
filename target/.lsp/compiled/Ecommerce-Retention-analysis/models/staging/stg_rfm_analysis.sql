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
    
FROM `cobalt-psyche-472916-h3`.`RFM_analysis`.`RFM_analysis_LTV`