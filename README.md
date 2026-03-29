🏥 Hospital Administration System (MySQL)
📌 Project Overview
This project simulates a real-world Hospital Administration System using MySQL.
It manages hospital operations such as departments, doctors, patients, appointments, and billing.

The project is designed as a Junior SQL Developer portfolio project and demonstrates:

Relational database design
Table relationships using foreign keys
Business-oriented SQL queries
CRUD operations
Advanced SQL concepts
🛠️ Tools Used
MySQL / MySQL Workbench – Database creation, table design, queries, and data manipulation
SQL – Joins, subqueries, aggregate functions, GROUP BY, HAVING
Microsoft Excel – Source dataset for hospital records
Git & GitHub – Version control and project hosting
VS Code / SQL Editor – Writing and organizing SQL scripts
🗂️ Project Structure

Hospital-Administration-System-MySQL/
├── database/
│   ├── 01_database_creation.sql
│   ├── 02_table_design.sql
│   └── 03_data_import.sql
│
├── queries/
│   ├── 04_business_queries.sql
│   ├── 05_update_delete.sql
│   └── 06_advanced_queries.sql
│
└── sample-data/
    └── hospital_dataset.xlsx

🎯 Features Implemented
Department and doctor management
Patient record maintenance
Appointment scheduling and tracking
Billing and payment status management
Business reporting using SQL queries
Update and delete operations
Advanced SQL analytics
📊 Business Queries Covered
Display patients with their doctor name and specialization
Show all appointments scheduled for today
List doctors working in a specific department
Calculate total revenue from paid bills
Identify patients with unpaid bills
Count total appointments handled by each doctor
Display department-wise doctor count
📌 Key Findings
Doctor–Patient Mapping: JOIN operations efficiently link patients with their doctors and departments.
Revenue Analysis: Billing data helps calculate total revenue and identify unpaid bills.
Appointment Insights: Appointment counts per doctor reveal workload distribution.
Department Analysis: GROUP BY queries show doctor distribution across departments.
Advanced SQL Usage: Subqueries and HAVING clauses enable deeper data analysis, such as identifying high-value bills and frequent consultations.
Data Integrity: Foreign key constraints ensure consistency across hospital records.
