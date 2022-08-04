-- Queries PH- Employee DB.sql
-- Deliverable 1:

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


-- Deliverable 2:
-- Create Mentorship Eligibility table as mentorship_eligibilty.csv
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
--filter on to_date to get current employees ('9999-01-01')
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;