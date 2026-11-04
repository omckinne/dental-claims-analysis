
/*
=========================================================
Project: Dental Claims Analysis
Database: dental_analytics
Table: dental_claims

Description:
This project analyzes fictional dental insurance
claims using SQL to identify billing patterns,
claim totals, and potential discrepancies.

Tools Used:
- MySQL
- MySQL Workbench

Dataset:
10 fictional dental insurance claims

Author: SQL Portfolio Project
=========================================================
*/
-- =====================================================
-- SECTION 1: TABLE CREATION
-- =====================================================

USE dental_analytics;
CREATE TABLE dental_claims (
Claim_ID INT PRIMARY KEY,
Patient_ID VARCHAR(10),
Provider VARCHAR(100),
Procedure_Name VARCHAR(100),
Claim_Date DATE,
Claim_Status VARCHAR(20),
Billed_Amount DECIMAL(10,2),
Paid_Amount DECIMAL(10,2)
); 
-- =====================================================
-- SECTION 2: DATA INSERTION
-- =====================================================
INSERT INTO dental_claims
(Claim_ID, Patient_ID, Provider, Procedure_Name, Claim_Date, Claim_Status, Billed_Amount, Paid_Amount)
VALUES
(1001, 'P001', 'Bright Smiles Dental', 'Cleaning', '2026-01-10', 'Paid', 150.00, 120.00),
(1002, 'P002', 'Family Dental Care', 'Filling', '2026-01-12', 'Paid', 250.00, 200.00),
(1003, 'P003', 'Bright Smiles Dental', 'Root Canal', '2026-01-15', 'Pending', 1200.00, 0.00),
(1004, 'P004', 'Smile Center', 'Extraction', '2026-01-18', 'Denied', 300.00, 0.00),
(1005, 'P005', 'Family Dental Care', 'Crown', '2026-01-20', 'Paid', 1000.00, 750.00),
(1006, 'P001', 'Smile Center', 'X-Ray', '2026-01-22', 'Paid', 100.00, 80.00),
(1007, 'P006', 'Bright Smiles Dental', 'Filling', '2026-01-25', 'Pending', 220.00, 0.00),
(1008, 'P007', 'Family Dental Care', 'Cleaning', '2026-01-28', 'Paid', 150.00, 150.00),
(1009, 'P008', 'Smile Center', 'Crown', '2026-02-02', 'Denied', 950.00, 0.00),
(1010, 'P009', 'Bright Smiles Dental', 'Root Canal', '2026-02-05', 'Paid', 1100.00, 900.00);

-- =====================================================
-- SECTION 3: DENTAL CLAIMS ANALYSIS
-- =====================================================
-- =====================================================
-- QUERY 1: IDENTIFY PENDING AND DENIED CLAIMS
-- Purpose: Identify claims with no payment and
-- calculate the unpaid amount for each claim.
-- =====================================================
SELECT
    Claim_ID,
    Provider,
    Procedure_Name,
    Claim_Status,
    Billed_Amount,
    Paid_Amount,
    Billed_Amount - Paid_Amount AS Unpaid_Amount
FROM dental_claims
WHERE Claim_Status IN ('Pending', 'Denied')
ORDER BY Billed_Amount DESC;

-- =====================================================
-- QUERY 2: ANALYZE CLAIMS BY PROVIDER
-- Purpose: Compare total claims, billed amounts,
-- paid amounts, and unpaid amounts by provider.
-- =====================================================
SELECT
    Provider,
    COUNT(*) AS Total_Claims,
    SUM(Billed_Amount) AS Total_Billed,
    SUM(Paid_Amount) AS Total_Paid,
    SUM(Billed_Amount - Paid_Amount) AS Total_Unpaid
FROM dental_claims
GROUP BY Provider
ORDER BY Total_Unpaid DESC;

-- =====================================================
-- QUERY 3: ANALYZE CLAIMS BY STATUS
-- Purpose: Evaluate claim totals and financial
-- amounts across Paid, Pending, and Denied claims.
-- =====================================================
SELECT
    Claim_Status,
    COUNT(*) AS Total_Claims,
    SUM(Billed_Amount) AS Total_Billed,
    SUM(Paid_Amount) AS Total_Paid,
    SUM(Billed_Amount - Paid_Amount) AS Total_Unpaid
FROM dental_claims
GROUP BY Claim_Status
ORDER BY Total_Unpaid DESC;

-- =====================================================
-- QUERY 4: IDENTIFY PARTIALLY PAID CLAIMS
-- Purpose: Find claims that received a payment
-- but still have an outstanding balance.
-- =====================================================
SELECT
    Claim_ID,
    Provider,
    Procedure_Name,
    Claim_Date,
    Billed_Amount,
    Paid_Amount,
    Billed_Amount - Paid_Amount AS Unpaid_Amount
FROM dental_claims
WHERE Paid_Amount > 0
  AND Paid_Amount < Billed_Amount
ORDER BY Unpaid_Amount DESC;

-- =====================================================
-- QUERY 5: ANALYZE CLAIMS BY PROCEDURE
-- Purpose: Compare claim volume and financial
-- performance across dental procedures.
-- =====================================================
SELECT
    Procedure_Name,
    COUNT(*) AS Total_Claims,
    SUM(Billed_Amount) AS Total_Billed,
    SUM(Paid_Amount) AS Total_Paid,
    SUM(Billed_Amount - Paid_Amount) AS Total_Unpaid
FROM dental_claims
GROUP BY Procedure_Name
ORDER BY Total_Unpaid DESC;

-- =====================================================
-- QUERY 6: IDENTIFY TOP 5 UNPAID CLAIMS
-- Purpose: Identify the five claims with the
-- largest outstanding balances.
-- =====================================================
SELECT
    Claim_ID,
    Provider,
    Procedure_Name,
    Claim_Status,
    Billed_Amount,
    Paid_Amount,
    Billed_Amount - Paid_Amount AS Unpaid_Amount
FROM dental_claims
WHERE Billed_Amount > Paid_Amount
ORDER BY Unpaid_Amount DESC
LIMIT 5;

-- =====================================================
-- SECTION 4: PROJECT FINDINGS
-- =====================================================

/*
Key Findings:

1. Total billed amount: $5,420.00
2. Total paid amount: $2,200.00
3. Total unpaid amount: $3,220.00

4. Pending claims total $1,420.00.
5. Denied claims total $1,250.00.
6. Bright Smiles Dental has the highest
   outstanding balance at $1,650.00.

Conclusion:
The analysis identified unpaid claims,
provider payment differences, and outstanding
balances that may require further review.
*/