# Dental Claims Analysis

## Project Overview
This project uses SQL and Power BI to analyze fictional dental insurance claims. The goal is to identify billing patterns, outstanding balances, payment discrepancies, provider trends, and claim statuses.

The project includes two components:
1. SQL analysis using MySQL to investigate claims and financial trends.
2. An interactive Power BI dashboard to visualize claim activity, provider performance, procedure trends, and denied claims.

## Tools Used
- MySQL
- MySQL Workbench
- SQL
- Microsoft Power BI

## Dataset
The dataset contains 10 fictional dental insurance claims with the following information:
- Claim ID
- Patient ID
- Provider
- Procedure Name
- Claim Date
- Claim Status
- Billed Amount
- Paid Amount

## SQL Analysis

### Business Questions
This project uses SQL to answer the following questions:

1. Which claims are pending or denied?
2. Which providers have the highest outstanding balances?
3. How do claim totals differ by status?
4. Which claims are partially paid?
5. Which dental procedures have the highest unpaid amounts?
6. Which five claims have the largest outstanding balances?

### Key SQL Findings
- Total billed amount: $5,420
- Total paid amount: $2,200
- Total unpaid amount: $3,220
- Pending claims have $1,420 outstanding.
- Denied claims have $1,250 outstanding.
- Bright Smiles Dental has the highest provider outstanding balance at $1,650.
- Root canals have the highest procedure outstanding balance at $1,400.
- Claim 1003 has the largest individual unpaid balance at $1,200.

### SQL Skills Demonstrated
- SELECT statements
- WHERE filtering
- Aggregate functions (COUNT, SUM)
- GROUP BY
- ORDER BY
- Calculated columns
- LIMIT
- Financial discrepancy analysis

## Power BI Dashboard

An interactive Power BI report was developed to turn the SQL analysis into visual insights.

The dashboard contains three report pages:

### 1. Claims Overview
Provides a high-level summary of dental claims, including:
- Total Billed Amount
- Total Paid Amount
- Outstanding Balance
- Total Claims
- Claims by Status

### 2. Provider & Claims Analysis
Explores claim activity across dental providers and procedures, including:
- Claims by Provider
- Claims by Procedure Type
- Claim volume comparisons

### 3. Denial Analysis
Focuses on denied claims and identifies patterns, including:
- Total Denied Claims
- Denied Claims by Provider
- Denied Claims by Procedure

### Power BI Skills Demonstrated
- Data visualization
- KPI cards
- Clustered column charts
- Clustered bar charts
- Visual-level filters
- DAX measures
- Financial metrics
- Dashboard design and reporting

## Conclusion
This project demonstrates how SQL and Power BI can be used together to analyze insurance claims, identify outstanding balances, and communicate findings through interactive visualizations.

The SQL analysis provides detailed financial insights, while the Power BI dashboard makes claim trends, provider activity, procedure patterns, and denial activity easier to understand.

Together, these tools demonstrate a practical data analytics workflow, from querying and analyzing data to presenting business insights.
