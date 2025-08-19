
--------------------------------------------
-- Data Cleaning --
--------------------------------------------
ALTER TABLE hr
MODIFY COLUMN hire_date DATE NULL;

SELECT *
FROM hr;

UPDATE hr
SET hire_date = CASE 
    WHEN hire_date LIKE '%/%' THEN DATE_FORMAT( STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN DATE_FORMAT( STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL 
    END;
    
DESCRIBE hr;


UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

ALTER TABLE hr
DROP COLUMN termdate;



ALTER TABLE  hr 
ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birth_date, CURDATE());


SELECT MIN(age), MAX(age)
FROM hr;


SELECT COUNT(*) FROM hr WHERE age < 18;

DELETE FROM hr
WHERE age < 18;

--------------------------------------------
-- SQL Queries --
--------------------------------------------

SELECT gender, COUNT(*)AS num_of_employees
FROM hr
WHERE hire_date < CURDATE()
GROUP BY gender;

SELECT gender, COUNT(*)AS total_count
FROM hr
GROUP BY gender;


SELECT race AS ethnic_race, COUNT(*) AS total_count
FROM hr
GROUP BY race;


SELECT CASE 
    WHEN age >= 18 AND age <= 25 THEN '18 - 25 Age'
    WHEN age >= 26 AND age <= 35 THEN '26 - 35 Age'
    WHEN age >= 36 AND age <= 45 THEN '36 - 45 Age'
    WHEN age >= 46 AND age <= 55 THEN '46 - 55 Age'
    WHEN age >= 56 AND age <= 65 THEN '56 - 65 Age'
    ELSE '66+'
    END AS age_group, gender ,COUNT(*) AS total_count
FROM hr 
GROUP BY CASE 
    WHEN age >= 18 AND age <= 25 THEN '18 - 25 Age'
    WHEN age >= 26 AND age <= 35 THEN '26 - 35 Age'
    WHEN age >= 36 AND age <= 45 THEN '36 - 45 Age'
    WHEN age >= 46 AND age <= 55 THEN '46 - 55 Age'
    WHEN age >= 56 AND age <= 65 THEN '56 - 65 Age'
    ELSE '66+'
    END, gender
ORDER BY age_group, gender;

SELECT location, COUNT(*) AS total_count
FROM hr
GROUP BY location
ORDER BY location;

SELECT department,gender, COUNT(jobtitle) AS total_count
FROM hr
GROUP BY department, gender
ORDER BY department;


SELECT location_state, COUNT(*) AS total_count
FROM hr
GROUP BY location_state
ORDER BY total_count DESC;


SELECT YEAR(hire_date) AS YEAR,
 COUNT(*) AS employees_hired, SUM(COUNT(*)) OVER()
FROM hr 
GROUP BY YEAR(hire_date) 
ORDER BY YEAR
 
 
 