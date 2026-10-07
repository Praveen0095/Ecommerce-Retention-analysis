SELECT
    user_id,
    age, 
    gender,
    country

FROM {{ source('rfm_analysis', 'rfm_dist') }}