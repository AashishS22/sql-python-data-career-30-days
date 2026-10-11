
-- Day 17 : Advanced JOIN patterns and self-joins
-- 		  : Self-Joins & Hierarchical Relationships

-- Sep 23, 2026


-- Using an Employee table with: employee_id,namem,manager_id, salary
-- Return employee_name, manager_name for all amployees, including employee who do not have a manager.

 SELECT 
 	e.name AS employee_name,
 	m.name AS manager_name
 FROM Employee e
 LEFT JOIN Employee m
 ON e.manager_id = m.employee_id;
 
 
 --Using an Employee table with: employee_id,namem,manager_id, salary
-- Return employee_name, manager_name, employee_salary, manager_salary; for employees whose salary is greater than their manager’s salary.
 
  SELECT 
 	e.name AS employee_name,
 	m.name AS manager_name,
 	e.salary AS employee_salary,
 	m.salary AS manager_salary
 FROM Employee e
 Inner JOIN Employee m
 ON e.manager_id = m.employee_id
  WHERE e.salary > m.salary;
 
  
  --Now find managers who have at least 2 direct reports.
  --Return: manager_id, manager_name, direct_reports
  
  SELECT 
  	e.manager_id,
  	m.name AS manger_name,
  	count(e.employee_id) AS direct_reports
  FROM Employee e
  INNER JOIN Employee m
  ON e.manager_id = m.employee_id
  GROUP BY manager_id, m.name
  HAVING count(m.employee_id) >= 2 ;
  
  --Employees with the same manager
  
  SELECT 
  	e.name AS employee_1,
  	m.name AS employee_2,
  	m.manager_id
  FROM Employee e1
  INNER JOIN Employee e2
  ON e2.manager_id = e1.manager_id
  AND e1.employee_id < e2.employee_id;
  
 -- Employee, Manager, and Manager’s Manager
  
  SELECT 
  	e.name AS employee_name,
  	m.name AS manager_name,
  	sm.name AS senior_manager_name
  FROM Employee e
  LEFT JOIN Employee m
  ON e.manager_id  = m.employee_id
  LEFT JOIN Employee sm
  ON m.manager_id = sm.employee_id;
  	
 -- find employees who share the same manager and also earn more than that manager
  SELECT DISTINCT
  	e.name AS employee_name,
  	m.name AS manager_name,
  	e.salary AS employee_salary,
  	m.salary AS manager_salary
  FROM Employee e
  INNER JOIN Employee m 
  	ON e.manager_id = m.employee_id
  INNER  JOIN Employee e2
  	ON e2.manager_id = e.manager_id
  	AND e2.employee_id <> e.employee_id
  WHERE e.salary > m.salary;
  
  
--
 SELECT 
 	e.name AS employee_name,
 	m.name AS manager_name
 FROM Employee e
 LEFT JOIN Employee m
 ON e.manager_id = m.employee_id;
  
  
  SELECT 
	  e.name AS employee_name,
	  m.name AS manager_name,
	  e.salary AS employee_salary,
	  m.salary AS manager_salary
FROM Employee e
INNER JOIN Employee m
ON e.manager_id = m.employee_id
WHERE e.salary> m.salary;
	  
  
 SELECT
 	m.employee_id AS manager_id
 	m.name AS manager_name,
 	count(e.employee_id) AS direct_reports
 FROM Employee e
 LEFT JOIN Employee m
 	ON e.manager_id = m.employee_id
GROUP BY e.manager_id, m.name
HAVING count(e.employee_id) >= 3;
  
  
 SELECT 
 	e.name AS employee_1,
 	m.name AS employee_2,
 	m.manager_id
 FROM Employee e
 INNER JOIN Employee m
 ON e.manager_id = m.manager_id
 AND e.employee_id < m.employee_id;
 	

 
  