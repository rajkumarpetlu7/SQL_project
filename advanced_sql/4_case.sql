
WITH company_job_count AS(
SELECT
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)
SELECT 
    cd.name AS company_name,
    cjc.total_jobs
FROM company_dim as cd
LEFT JOIN company_job_count as cjc ON 
    cjc.company_id = cd.company_id
ORDER BY cjc.total_jobs DESC
    ;