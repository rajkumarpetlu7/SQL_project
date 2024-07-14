SELECT 
    quarter1_jobs.job_title_short,
    quarter1_jobs.job_location,
    quarter1_jobs.job_via,
    quarter1_jobs.job_posted_date::DATE,
    quarter1_jobs.salary_year_avg
FROM
(
SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL 
SELECT *
FROM march_jobs
) AS quarter1_jobs
WHERE 
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
