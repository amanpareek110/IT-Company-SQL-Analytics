/* ============================================================
   IT Company Business & Workforce Analytics — SQL Project 
 ==============================================================*/
 
--  Database : it_company_analytics_db
--  Tool     : MySQL
--  Dataset  : IT Company Business & Workforce Analytics
--  Source   : Kaggle

-- Tables Used:
--  1. Employees  -> company department wise data
--  2. Clients    -> company industry wise data
--  3. Projects   -> company clint_id, employee wise project_id data
--  4. Technologies -> company technology, project_id wise technology_id
--  5. Office_Locations -> company country, state, city, employees wise office_id      
--  6. Company_Financials -> company year, quarter, revenue, profit, employees wise financial_id

-- Purpose:
--  Import and prepare IT Company Business & Workforce Analytics data for SQL analysis.


-- ===========================================================================
--    DATABASE SETUP
-- ===========================================================================

CREATE DATABASE it_company_analytics_db;
USE it_company_analytics_db;


-- ===========================================================================
-- Project Overview
-- ===========================================================================
--    IT Company Business & Workforce Analytics is a SQL-based data analytics project designed to analyze and evaluate key 
--    business operations across multiple IT companies.

--    The project uses multiple interconnected datasets covering employees, projects, clients, technologies, office locations, 
--    and company financials. SQL is used to explore workforce distribution, salary patterns, project budgets, technology adoption,
--    client contract values, revenue, profit, and other important business metrics.

--    The primary objective of this project is to demonstrate how SQL can be used to transform large-scale business data into meaningful
--    insights that support data-driven analysis and business decision-making.

-- Key Areas of Analysis
--  1. Employee & Workforce Analysis
--  2. Salary Analysis
--  3. Project & Budget Analysis
--  4. Technology Adoption
--  5. Client & Contract Analysis
--  6. Office & Location Analysis
--  7. Revenue & Profit Analysis
--  8. Business Performance KPIs

-- The project progresses from basic SQL queries to advanced data analysis, using concepts such as
-- SELECT, WHERE, GROUP BY, aggregate functions, HAVING, JOINs, subqueries, CASE, and calculated KPIs.

-- =====================================================================================================================================================
--  IT Company SQL Analytics Project — 20 Questions
-- =====================================================================================================================================================

# Level        | Questions |           Main SQL Concepts                                 |
#------------- | --------- | ----------------------------------------------------------- |
# Easy         |       1–5 | SELECT, WHERE, COUNT, AVG, MAX, ORDER BY                    |
# Intermediate |      6–12 | GROUP BY, SUM, HAVING, LIMIT, Aggregations                  |
# Advanced     |     13–20 | JOIN, CASE, KPI, Conditional Aggregation, Business Analysis |

-- =====================================================
--                    LEVEL 1 — EASY
-- =====================================================

-- Q1. What is the total number of employees across all companies?

SELECT COUNT(*) AS Total_Employees
FROM Employees;

-- Q2. How many employees are working in each company?

SELECT
    Company,
    COUNT(*) AS Total_Employees
FROM Employees
GROUP BY Company
ORDER BY Total_Employees DESC;

-- Q3. What is the average salary of all employees?

SELECT
    ROUND(AVG(Salary), 2) AS Average_Salary
FROM Employees;

-- Q4. What is the highest salary recorded among employees?

SELECT
    MAX(Salary) AS Highest_Salary
FROM Employees;

-- Q5. Which employees have a salary greater than 100,000?

SELECT
    Employee_ID,
    Company,
    Department,
    Role,
    Salary
FROM Employees
WHERE Salary > 100000
ORDER BY Salary DESC;

-- =====================================================
--              LEVEL 2 — INTERMEDIATE
-- =====================================================

-- Q6. How is the workforce distributed across different departments?

SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM Employees
GROUP BY Department
ORDER BY Total_Employees DESC;

-- Q7. What is the average employee salary for each company?

SELECT
    Company,
    ROUND(AVG(Salary), 2) AS Average_Salary
FROM Employees
GROUP BY Company
ORDER BY Average_Salary DESC;

-- Q8. How many projects are currently in each project status?

SELECT
    Status,
    COUNT(*) AS Total_Projects
FROM Projects
GROUP BY Status
ORDER BY Total_Projects DESC;

-- Q9. What is the total project budget allocated by each company?

SELECT
    Company,
    SUM(Budget) AS Total_Project_Budget
FROM Projects
GROUP BY Company
ORDER BY Total_Project_Budget DESC;

-- Q10. What are the top 10 highest-budget projects?

SELECT
    Project_ID,
    Company,
    Technology,
    Budget,
    Status
FROM Projects
ORDER BY Budget DESC
LIMIT 10;

-- Q11. Which technologies are used across the highest number of projects?

SELECT
    Technology,
    COUNT(*) AS Project_Count
FROM Projects
GROUP BY Technology
ORDER BY Project_Count DESC;

-- Q12. Which client industries have the highest total contract value?

SELECT
    Industry,
    COUNT(*) AS Total_Clients,
    SUM(ContractValue) AS Total_Contract_Value
FROM Clients
GROUP BY Industry
ORDER BY Total_Contract_Value DESC;

-- =====================================================
--               LEVEL 3 — ADVANCED
-- =====================================================

-- Q13. How many projects are assigned to each employee?

SELECT
    e.Employee_ID,
    e.Company,
    e.Department,
    e.Role,
    COUNT(p.Project_ID) AS Total_Projects
FROM Employees e
LEFT JOIN Projects p
    ON e.Employee_ID = p.Employee_ID
GROUP BY
    e.Employee_ID,
    e.Company,
    e.Department,
    e.Role
ORDER BY Total_Projects DESC;

-- Q14. Which employees are assigned to multiple projects?

SELECT
    e.Employee_ID,
    e.Company,
    e.Department,
    e.Role,
    COUNT(p.Project_ID) AS Total_Projects
FROM Employees e
JOIN Projects p
    ON e.Employee_ID = p.Employee_ID
GROUP BY
    e.Employee_ID,
    e.Company,
    e.Department,
    e.Role
HAVING COUNT(p.Project_ID) > 1
ORDER BY Total_Projects DESC;

-- Q15. What is the total and average project budget for each company?

SELECT
    Company,
    COUNT(*) AS Total_Projects,
    SUM(Budget) AS Total_Budget,
    ROUND(AVG(Budget), 2) AS Average_Budget
FROM Projects
GROUP BY Company
ORDER BY Total_Budget DESC;

-- Q16. How many projects and what total project budget are associated with each client?

SELECT
    c.Client_ID,
    c.Industry,
    c.Country,
    COUNT(p.Project_ID) AS Total_Projects,
    COALESCE(SUM(p.Budget), 0) AS Total_Project_Budget
FROM Clients c
LEFT JOIN Projects p
    ON c.Client_ID = p.Client_ID
GROUP BY
    c.Client_ID,
    c.Industry,
    c.Country
ORDER BY Total_Project_Budget DESC;

-- Q17. Which technologies are associated with the highest total project budgets?

SELECT
    Technology,
    COUNT(*) AS Total_Projects,
    SUM(Budget) AS Total_Budget,
    ROUND(AVG(Budget), 2) AS Average_Budget
FROM Projects
GROUP BY Technology
ORDER BY Total_Budget DESC;

-- Q18. How does project performance vary by company and technology?

SELECT
    Company,
    Technology,
    COUNT(*) AS Total_Projects,
    SUM(Budget) AS Total_Budget
FROM Projects
GROUP BY
    Company,
    Technology
ORDER BY
    Company,
    Total_Budget DESC;
    
-- Q19. What are the total revenue, total profit, and profit margin for each company?

SELECT
    Company,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM Company_Financials
GROUP BY Company
ORDER BY Profit_Margin_Percent DESC;

-- Q20. What is the overall business performance of each company based on employees, projects, project budgets, revenue, and profit?

SELECT
    e.Company,
    e.Total_Employees,
    p.Total_Projects,
    p.Total_Project_Budget,
    f.Total_Revenue,
    f.Total_Profit
FROM
(
    SELECT
        Company,
        COUNT(*) AS Total_Employees
    FROM Employees
    GROUP BY Company
) e
LEFT JOIN
(
    SELECT
        Company,
        COUNT(*) AS Total_Projects,
        SUM(Budget) AS Total_Project_Budget
    FROM Projects
    GROUP BY Company
) p
    ON e.Company = p.Company
LEFT JOIN
(
    SELECT
        Company,
        SUM(Revenue) AS Total_Revenue,
        SUM(Profit) AS Total_Profit
    FROM Company_Financials
    GROUP BY Company
) f
    ON e.Company = f.Company;


-- ===========================================================================
--  Project Insights
-- ===========================================================================

/* 1. Workforce Distribution

      The dataset contains 250,000 employees distributed across four companies:TCS, Infosys, Wipro, and HCLTech.
	The workforce distribution is relatively balanced,with each company having approximately 62,000–63,000 employees.

2. Salary Analysis

   The overall average employee salary is approximately 78,896, while the maximum recorded salary is 150,000.
Average salaries across the four companies are also closely aligned, indicating a relatively consistent salary structure within the dataset.

3. Department Distribution

   The workforce is distributed across 8 departments, including Support, Finance, AI, Engineering, HR, Sales, Cloud, and IT. 
Support has the largest employee count, while IT has the smallest, although the difference between departments is relatively small.

4. Project Portfolio

    The dataset contains 180,000 projects across the four companies. TCS has the largest number of projects, with more than 45,000 projects,
while the project volumes of all four companies remain relatively close.

5. Project Status

    Projects are distributed across three statuses: Completed, On Hold, and In Progress. 
There are approximately 60,000 projects in each status, showing a highly balanced project-status distribution within the dataset.

6. Project Budget

    The combined project budget across all companies is approximately 904.75 billion in the dataset's recorded monetary units. 
TCS has the largest aggregate project budget at approximately 228.06 billion.

7. Technology Adoption

	Six major technologies are represented in the project data: Azure, Python, GCP, AWS, SAP, and Java. 
Azure appears in the largest number of projects, with approximately 30,103 projects, while Java appears in approximately 29,899 projects.

8. Client Industry Analysis

    Clients belong to five major industries: Manufacturing, Healthcare, Retail, Banking, and Telecom. 
Manufacturing has the highest aggregate contract value at approximately 603.19 billion, while Telecom has approximately 597.51 billion.

9. Technology Budget Analysis

	Python-associated projects account for approximately 151.23 billion in total project budgets, followed by AWS and SAP. 
The average budget per technology is relatively similar, indicating that project budgets are broadly distributed across the technology portfolio.

10. Financial Performance

    The financial dataset contains revenue and profit information for all four companies. TCS records approximately 148.17 million 
in total revenue, while Wipro records approximately 38.85 million in total profit.

11. Profit Margin

    The calculated profit margins for the four companies are all close to 26%, indicating 
a relatively consistent profitability pattern across the dataset.

12. Year-wise Financial Trend

    Financial records are available from 2015 to 2026. Annual revenue and profit remain within a relatively narrow range 
throughout the period, showing limited variation in the dataset's recorded financial performance.


-- ==========================================================================================
--   Project Conclusion
-- ===========================================================================================

   The **IT Company Business & Workforce Analytics** project demonstrates how SQL can transform large, interconnected business datasets 
into meaningful analytical insights.

By combining data from **Employees, Projects, Clients, Technologies, Office Locations, and Company Financials**, 
the project provides a comprehensive view of workforce structure, project operations, technology adoption, client relationships, 
geographic presence, and financial performance.

Through SQL techniques such as **JOINs, GROUP BY, aggregate functions, subqueries, filtering, and multi-table analysis**, 
the project answers important business questions and highlights key performance indicators.

Overall, this project demonstrates practical skills in **SQL, relational data analysis, business intelligence, data interpretation, 
and analytical problem-solving**, making it a strong portfolio example of using SQL for real-world business analytics.


IT Company Business & Workforce Analytics
       SQL Analysis Framework

1.	  Employees---------------------------------------------------↓
          ↓
  Workforce & Salary											  ↓
	
2.	   Projects---------------------------------------------------↓
		  ↓
   Budget & Status												  ↓	
  
3.      Clients---------------------------------------------------↓
          ↓
 Industry & Contracts
														    SQL Analysis											       												
4.	  Technologies---------------------------->     JOINs • GROUP BY • Aggregation
          ↓											  Subqueries • Business KPIs
  Technology Adoption

5.	  Financials---------------------------------------------------↑
		  ↓
   Revenue & Profit												   ↑												
   
6.   Office Locations ---------------------------------------------↑
          ↓
  Geographic Analysis


Employees, departments and salaries
Operations
Projects, clients and technologies
Performance
Revenue, profit and business KPIs 



=================================================================================================================================
      END OF IT Company Business & Workforce Analytics — SQL Project
================================================================================================================================= */






