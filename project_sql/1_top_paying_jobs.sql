/* What are the top paying jobs */

SELECT 
    job_id,
    job_title,
    name as company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE as job_ad_date  
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Canada' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;