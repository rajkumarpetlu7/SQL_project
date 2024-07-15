/* Skills which pays highest average salary */

SELECT 
    skills,
    ROUND(avg(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg is NOT NULL AND
    job_location = 'Anywhere'
GROUP BY 
    skills  
ORDER BY
    avg_salary DESC
LIMIT 25


/* Questions:

What are the top four most paid skills according to the dataset?
What is the average salary associated with each of these high-paying skills?
How can these salary insights be leveraged for effective career planning and development?
Insights:

Top Paid Skill: The dataset reveals that the highest paying skill is PySpark, with an average salary of $208,172.25. This indicates a significant demand and value for professionals proficient in PySpark, making it a highly lucrative skill to develop.
Other High Paying Skills: Bitbucket, Couchbase, and Watson also feature prominently among the top-paid skills, with average salaries of $189,154.50, $160,515.00, and $160,515.00 respectively. These skills are highly sought after in the industry, reflecting their importance and the premium companies are willing to pay for expertise in these areas.
Career Planning: Understanding these salary insights is crucial for career planning. Professionals and aspiring data scientists can use this information to prioritize acquiring or improving skills in PySpark, Bitbucket, Couchbase, and Watson. By focusing on these high-value skills, individuals can enhance their marketability and secure higher-paying job opportunities in the competitive tech industry.
*/