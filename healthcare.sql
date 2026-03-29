SELECT * FROM healthcare.patient_visits;

Select count(icd_code)
from healthcare.patient_visits;


SELECT 
    patient_id,
    date_of_birth,
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(date_of_birth, '%m/%d/%Y'), CURDATE()) AS calculated_age
FROM healthcare.patient_visits;

SELECT 
CASE
    WHEN patient_age < 18 THEN 'UNDER 18'
    WHEN patient_age BETWEEN 18 AND 39 THEN '18-39'
    WHEN patient_age BETWEEN 40 AND 64 THEN '40-64'
    ELSE '65+'
END AS age_group,
COUNT(*) AS patient_id
FROM healthcare.patient_visits
GROUP BY age_group
ORDER BY age_group;

SELECT icd_code , patient_sex, 
CASE
    WHEN patient_age < 18 THEN 'UNDER 18'
    WHEN patient_age BETWEEN 18 AND 39 THEN '18-39'
    WHEN patient_age BETWEEN 40 AND 64 THEN '40-64'
    ELSE '65+'
END AS age_group,
COUNT(*) AS diagonosis_count,
COUNT(*) OVER (PARTITION BY 
CASE
    WHEN patient_age < 18 THEN 'UNDER 18'
    WHEN patient_age BETWEEN 18 AND 39 THEN '18-39'
    WHEN patient_age BETWEEN 40 AND 64 THEN '40-64'
    ELSE '65+'
END ) AS age_group_count
FROM healthcare.patient_visits
GROUP BY icd_code , patient_sex , age_group
ORDER BY diagonosis_count DESC
;

SELECT patient_id, 
COUNT(*) AS no_of_count 
FROM healthcare.patient_visits 
GROUP BY patient_id 
ORDER BY no_of_count DESC;

SELECT avg(total_visits) AS avg_visit
from (
SELECT patient_id, 
COUNT(*) AS total_visits
FROM healthcare.patient_visits 
GROUP BY patient_id 
) AS sub_query;








 

