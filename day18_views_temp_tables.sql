-- Day 18: PostgreSQL Views & Temporary Tables

/*
1. Understand VIEW
2. Create/query/update/drop views
3. Understand temporary tables
4. Compare View vs CTE vs Temp Table
5. Practice problems
*/
--Creating a view 
CREATE VIEW higher_sal_company AS 
SELECT 
	j.job_id,
	j.job_title_short,
	c.name AS company_name, 
	j.job_location,
	j.salary_year_avg
FROM job_postings_fact j
JOIN company_dim c
	ON c.company_id  = j.company_id 
WHERE j.salary_year_avg IS NOT NULL 
	AND j.salary_year_avg  > 100000 ;

SELECT 
	*
FROM higher_sal_company
WHERE job_title_short = 'Data Engineer';

SELECT 
	company_name,
	avg(salary_year_avg) AS average_salary
FROM higher_sal_company
GROUP BY company_name;


-- Changing an existing view

CREATE OR REPLACE VIEW higher_sal_company AS 
SELECT 
	j.job_id,
	j.job_title_short,
	c.name AS company_name, 
	j.job_location,
	j.salary_year_avg
FROM job_postings_fact j
JOIN company_dim c
	ON c.company_id  = j.company_id 
WHERE j.salary_year_avg IS NOT NULL 
	AND j.salary_year_avg  > 200000 ;


SELECT 
	*
FROM higher_sal_company
WHERE job_title_short = 'Data Engineer';


-- Dropping a view

DROP VIEW IF EXISTS higher_sal_company;


/* Exercises */

CREATE VIEW remote_high_salary_jobs AS 
SELECT 
	job_id,
	job_title_short,
	job_location,
	salary_year_avg
FROM job_postings_fact
WHERE job_work_from_home = TRUE 
	AND salary_year_avg IS NOT NULL 
	AND salary_year_avg > 120000;

SELECT *
FROM remote_high_salary_jobs
ORDER BY salary_year_avg desc;



-- TEMP table 
/* It created a temporary table with rows for your current database session.
 * it stored a temporary result set
 * Exists only for current session
 */

CREATE TEMP TABLE analyst_jobs AS 
SELECT *
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';


SELECT *
FROM analyst_jobs

DROP TABLE analyst_jobs;

-- Exercise --

--2.

CREATE TEMP TABLE data_engineer_jobs_temp AS 
SELECT 
	job_id,
	job_title_short,
	job_location,
	salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'
	AND salary_year_avg > 90000;

SELECT *
FROM data_engineer_jobs_temp
ORDER BY salary_year_avg desc;
		

--3.
CREATE VIEW company_salary_summary AS 
SELECT
	company_id,
	count(job_Id) AS job_count,
	avg(salary_year_avg) AS average_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL 
GROUP BY company_id
HAVING count(job_Id) >= 5;


SELECT *
FROM company_salary_summary
WHERE average_salary > 120000
ORDER BY average_salary DESC;
 


--4
CREATE VIEW remote_data_analyst_jobs AS 
SELECT
	job_id,
	company_id,
	job_title_short,
	job_location,
	salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
	AND salary_year_avg IS NOt NULL 
	AND job_work_from_home = TRUE;
	

SELECT 
	company_id,
	count(job_id) AS job_count,
	avg(salary_year_avg) AS average_salary
FROM remote_data_analyst_jobs 
GROUP BY company_id 
HAVING count(job_id) >= 3
ORDER BY average_salary DESC;



/*
VIEW = A window into the data
It shows data from the original table. If the underlying marks change to 90, 
the view will generally show 90 when queried again.


TEMP TABLE = A temporary copy of the results
If the temporary table captured marks of 85, 
it keeps 85 even if the original table later changes to 90, unless you update or recreate the temporary table.


*/





