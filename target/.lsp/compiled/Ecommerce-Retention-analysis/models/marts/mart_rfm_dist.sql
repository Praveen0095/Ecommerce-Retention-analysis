SELECT 
    country AS Country,
    SUM( CASE
         WHEN segment = 'Champions' THEN segment_percentage
         ELSE 0 END  ) AS Champions,
    SUM( CASE
         WHEN segment = 'Loyal Customer' THEN segment_percentage
         ELSE 0 END  ) AS Loyal_customer,
    SUM( CASE
         WHEN segment = 'New Customer' THEN segment_percentage
         ELSE 0 END  ) AS New_customer, 
    SUM( CASE
         WHEN segment = 'Regular Customer' THEN segment_percentage
         ELSE 0 END  ) AS Regular_Customer,
    SUM( CASE
         WHEN segment = 'At Risk' THEN segment_percentage
         ELSE 0 END  ) AS At_Risk,
    SUM( CASE
         WHEN segment = 'Lost Customer' THEN segment_percentage
         ELSE 0 END  ) AS Lost_Customer, 
FROM 
(
    SELECT 
        d.country as country,
        r.segment as segment,
        ROUND(COUNT(r.user_id) * 100 / SUM(COUNT(r.user_id)) OVER (PARTITION BY d.country),2)  as segment_percentage
    FROM `cobalt-psyche-472916-h3`.`dbt_ps`.`stg_rfm_analysis` as r 
    JOIN `cobalt-psyche-472916-h3`.`dbt_ps`.`stg_rfm_distr` as d
    ON r.user_id = d.user_id
    GROUP BY r.segment, d.country
)  
GROUP BY country
order by country