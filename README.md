# IT Company Business & Workforce Analytics

## 📊 Project Overview

**IT Company Business & Workforce Analytics** is a MySQL-based SQL analytics project designed to analyze and evaluate key business operations across multiple IT companies.

The project uses multiple interconnected datasets covering **employees, projects, clients, technologies, office locations, and company financials**. SQL is used to analyze workforce distribution, salary patterns, project budgets, technology adoption, client contract values, geographic presence, revenue, profit, and business performance.

The primary objective of this project is to demonstrate how SQL can transform large-scale business data into meaningful insights that support **data-driven analysis and business decision-making**.

---

## 🎯 Project Objectives

The project focuses on analyzing:

* 👥 Employee & Workforce Distribution
* 💰 Salary Structure
* 📁 Project Portfolio & Budgets
* 💻 Technology Adoption
* 🤝 Client & Contract Analysis
* 🌍 Office & Geographic Analysis
* 📈 Revenue & Profit
* 📊 Business Performance KPIs

---

## 🗄️ Database

**Database:** `it_company_analytics_db`
**SQL Tool:** MySQL
**Dataset:** IT Company Business & Workforce Analytics
**Source:** Kaggle

The project begins by creating and selecting the MySQL database:

```sql
CREATE DATABASE it_company_analytics_db;
USE it_company_analytics_db;
```

---

## 📋 Dataset & Tables

The project contains six interconnected tables:

| Table                | Description                                                                   |
| -------------------- | ----------------------------------------------------------------------------- |
| `Employees`          | Employee, company, department, role, age, salary and joining-date information |
| `Projects`           | Project, company, client, employee, technology, budget and status information |
| `Clients`            | Client industry, country and contract-value information                       |
| `Technologies`       | Technology and project-level technology information                           |
| `Office_Locations`   | Company office, country, state, city and employee information                 |
| `Company_Financials` | Company-wise yearly and quarterly revenue, profit and employee information    |

---

## 🔍 SQL Analysis Framework

The project contains **20 business questions** divided into three analytical levels.

### 🟢 Level 1 — Basic Analysis

| # | Business Question                                           | SQL Concepts          |
| - | ----------------------------------------------------------- | --------------------- |
| 1 | What is the total number of employees across all companies? | `COUNT()`             |
| 2 | How many employees are working in each company?             | `GROUP BY`, `COUNT()` |
| 3 | What is the average salary of all employees?                | `AVG()`               |
| 4 | What is the highest salary recorded among employees?        | `MAX()`               |
| 5 | Which employees have a salary greater than 100,000?         | `WHERE`, `ORDER BY`   |

### 🟡 Level 2 — Intermediate Analysis

| #  | Business Question                                                  | SQL Concepts          |
| -- | ------------------------------------------------------------------ | --------------------- |
| 6  | How is the workforce distributed across departments?               | `GROUP BY`, `COUNT()` |
| 7  | What is the average employee salary for each company?              | `GROUP BY`, `AVG()`   |
| 8  | How many projects are currently in each project status?            | `GROUP BY`, `COUNT()` |
| 9  | What is the total project budget allocated by each company?        | `SUM()`, `GROUP BY`   |
| 10 | What are the top 10 highest-budget projects?                       | `ORDER BY`, `LIMIT`   |
| 11 | Which technologies are used across the highest number of projects? | `GROUP BY`, `COUNT()` |
| 12 | Which client industries have the highest total contract value?     | `SUM()`, `GROUP BY`   |

### 🔴 Level 3 — Advanced Analysis

| #  | Business Question                                                                | SQL Concepts                           |
| -- | -------------------------------------------------------------------------------- | -------------------------------------- |
| 13 | How many projects are assigned to each employee?                                 | `JOIN`, `COUNT()`                      |
| 14 | Which employees are assigned to multiple projects?                               | `JOIN`, `HAVING`                       |
| 15 | What is the total and average project budget for each company?                   | Aggregation                            |
| 16 | How many projects and what total project budget are associated with each client? | `LEFT JOIN`, `SUM()`                   |
| 17 | Which technologies are associated with the highest total project budgets?        | Aggregation                            |
| 18 | How does project performance vary by company and technology?                     | `GROUP BY`, Multi-dimensional Analysis |
| 19 | What are the total revenue, total profit, and profit margin for each company?    | Aggregation, Calculated KPI            |
| 20 | What is the overall business performance of each company?                        | `JOIN`, Subqueries, KPI Analysis       |

---

## 🧠 SQL Concepts Used

This project demonstrates practical use of:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `HAVING`
* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `ROUND()`
* `LIMIT`
* `JOIN`
* `LEFT JOIN`
* Subqueries
* `CASE`
* Conditional Aggregation
* Calculated KPIs
* Multi-table Analysis

The analysis progresses from basic SQL queries to advanced business analysis using joins, aggregations, subqueries and KPI calculations.

---

## 📊 Key Project Insights

### 👥 Workforce

* The dataset contains **250,000 employees** across four companies:

  * TCS
  * Infosys
  * Wipro
  * HCLTech
* Workforce distribution is relatively balanced across the companies.

### 💰 Salary Analysis

* Overall average employee salary is approximately **78,896**.
* Maximum recorded salary is **150,000**.
* Average salaries across the four companies are relatively closely aligned.

### 🏢 Department Analysis

The workforce is distributed across **8 departments**:

* Support
* Finance
* AI
* Engineering
* HR
* Sales
* Cloud
* IT

Support has the largest employee count, while IT has the smallest within the dataset.

### 📁 Project Portfolio

* The dataset contains **180,000 projects**.
* TCS has more than **45,000 projects**.
* Project volumes remain relatively close across the four companies.

### 📌 Project Status

Projects are distributed across:

* Completed
* In Progress
* On Hold

The dataset contains approximately **60,000 projects in each status**.

### 💵 Project Budget

* Combined project budget: approximately **904.75 billion** in the dataset's recorded monetary units.
* TCS has the largest aggregate project budget at approximately **228.06 billion**.

### 💻 Technology Adoption

The project dataset contains six major technologies:

* Azure
* Python
* GCP
* AWS
* SAP
* Java

Azure appears in approximately **30,103 projects**, while Java appears in approximately **29,899 projects**.

### 🤝 Client Industry Analysis

Clients belong to five major industries:

* Manufacturing
* Healthcare
* Retail
* Banking
* Telecom

Manufacturing has the highest aggregate contract value at approximately **603.19 billion**, while Telecom has approximately **597.51 billion**.

### 💻 Technology Budget Analysis

Python-associated projects account for approximately **151.23 billion** in total project budgets, followed by AWS and SAP.

### 📈 Financial Performance

The financial dataset contains revenue and profit information for all four companies.

* TCS records approximately **148.17 million** in total revenue.
* Wipro records approximately **38.85 million** in total profit.
* Calculated profit margins for the four companies are close to **26%**.
* Financial records cover the period from **2015 to 2026**.

---

## 🔄 Project Workflow

```text
DATASET
   ↓
DATABASE
   ↓
TABLES
   ↓
SQL QUESTIONS
   ↓
SQL QUERIES
   ↓
QUERY RESULTS
   ↓
BUSINESS INSIGHTS
   ↓
DECISION SUPPORT
```

---

## 🏗️ Analysis Framework

```text
Employees
   ↓
Workforce & Salary Analysis

Projects
   ↓
Budget & Project Status

Clients
   ↓
Industry & Contract Analysis

Technologies
   ↓
Technology Adoption

Company Financials
   ↓
Revenue & Profit

Office Locations
   ↓
Geographic Analysis

          ↓

SQL Analysis
JOINs • GROUP BY • Aggregations
Subqueries • Business KPIs
```

---

## 📂 Project Structure

```text
IT-Company-SQL-Analytics/
│
├── README.md
│
├── sql/
│   └── IT_Company_SQL_Analytics.sql
│
├── data/
│   ├── Employees.csv
│   ├── Projects.csv
│   ├── Clients.csv
│   ├── Technologies.csv
│   ├── Office_Locations.csv
│   └── Company_Financials.csv
│
└── screenshots/
    ├── employee-analysis.png
    ├── project-analysis.png
    ├── technology-analysis.png
    ├── financial-analysis.png
    └── company-performance.png
```

> The `data/` and `screenshots/` folders should be included if the corresponding files are available.

---

## 🛠️ Tools & Technologies

* **MySQL**
* **SQL**
* **Relational Database Concepts**
* **Data Analysis**
* **Business Analytics**
* **KPI Analysis**
* **GitHub**

---

## 📌 Project Highlights

This project demonstrates practical experience with:

* Large-scale relational datasets
* Multi-table SQL analysis
* Employee and workforce analytics
* Project portfolio analysis
* Technology adoption analysis
* Client and contract analysis
* Financial performance analysis
* Business KPI development
* Advanced SQL joins and subqueries
* Translating SQL results into business insights

---

## 🏁 Conclusion

The **IT Company Business & Workforce Analytics** project demonstrates how SQL can transform interconnected business datasets into meaningful analytical insights.

By combining data from **Employees, Projects, Clients, Technologies, Office Locations, and Company Financials**, the project provides a comprehensive view of workforce structure, project operations, technology adoption, client relationships, geographic presence, and financial performance.

Through SQL techniques such as **JOINs, GROUP BY, aggregate functions, filtering, subqueries, and multi-table analysis**, the project answers important business questions and highlights key performance indicators.

Overall, this project demonstrates practical skills in **SQL, relational data analysis, business intelligence, data interpretation, and analytical problem-solving**.

---

## 👨‍💻 Author

**Aman Pareek**

Aspiring Data Analyst | SQL | Excel | Power BI | Python

---

⭐ If you find this project useful, consider giving the repository a star.

