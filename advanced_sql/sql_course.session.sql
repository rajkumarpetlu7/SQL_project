WITH remote_job_skills AS(
SELECT
    skill_id,
    COUNT(*) AS skill_count
FROM 
    skills_job_dim as stj
INNER JOIN job_postings_fact jp ON
    jp.job_id = stj.job_id
WHERE 
    jp.job_work_from_home = TRUE
GROUP BY skill_id
)

SELECT 
    skills.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills rj
INNER JOIN skills_dim skills
ON skills.skill_id = rj.skill_id
ORDER BY skill_count DESC
LIMIT 5