# HR Employee Data Analysis

This project explores a synthetic HR dataset using **SQL** and **Power BI** to uncover insights about workforce demographics, hiring trends, and diversity distribution. The goal was to practice end-to-end data handling: from cleaning raw data to generating interactive dashboards.

## Project Workflow

1. **Data Preparation**
   - Imported the raw HR dataset into MySQL.
   - Standardized inconsistent formats (e.g., dates stored as text, missing IDs).
   - Converted key columns to appropriate data types (`DATE` for birthdate/hire_date, `ENUM` for gender, etc.).
   - Ensured data integrity by setting `employee_id` as the primary key.

2. **SQL Analysis**
   - Hires by year with percentage contribution.
   - Employee distribution by department, gender, and race.
   - Location-based insights (Headquarters vs. Remote).
   - Detection of anomalies (e.g., invalid birthdates or term dates).

3. **Visualization in Power BI**
   - **Gender distribution** across the organization.
   - **Age group breakdown** with gender splits.
   - **Department diversity** by gender.
   - **Race and ethnicity distribution** across employees.
   - **Remote vs. headquarters** workforce split.

## Key Insights

- Workforce is split almost evenly between male and female employees, with a small but notable non-conforming group.  
- The majority of employees are between **26–45 years old**, indicating a mid-career heavy workforce.  
- Engineering and Sales are the largest departments, each with over **3,000 employees**.  
- Around **25% of employees work remotely**, while the rest are based at headquarters.  
- Racial diversity shows a majority White population (~28%), but significant representation across other groups.  

## Tools Used

- **MySQL** for data cleaning and exploration  
- **Power BI** for visualization and dashboards  
- **SQL scripts** (`HR_Employee_Data.sql`) and **dashboard report** (`HR_Employee_Report.pdf`) included in repository  
