-- Queries PH- Employee DB.sql

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t 
	ON (e.emp_no = t.emp_no)
--filter on birthdate
WHERE (e.birth_date) BETWEEN ('1951-01-01') AND ('1955-12-31')
ORDER BY e.emp_no;

--Starter code
-- Use Dictinct with Orderby to remove duplicate rows
--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--from retirement_titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Create retiring_titles
SELECT COUNT(ut.title), ut.title
INTO Retiring_Titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY Count DESC