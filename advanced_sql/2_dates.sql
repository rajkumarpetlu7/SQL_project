SELECT 
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date,
    EXTRACT(MONTH FROM job_posted_date) as date_month
FROM
    job_postings_fact
LIMIT 5;


SELECT
    COUNT(job_id) AS job_cnt,
    EXTRACT(MONTH FROM job_posted_date) as date_month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY date_month
ORDER BY job_cnt DESC
;

SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS year_avg, 
    AVG(salary_hour_avg) AS hour_avg,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM 
    job_postings_fact
WHERE 
    EXTRACT(MONTH FROM job_posted_date) > 6
GROUP BY 
    job_schedule_type, 
    date_month;

