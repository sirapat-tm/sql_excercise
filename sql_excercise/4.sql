-- 4. Provide a query showing only the Employees who are Sales Agents.
SELECT
  *
FROM employees
WHERE (title LIKE '%sales%' AND title LIKE '%agent')
