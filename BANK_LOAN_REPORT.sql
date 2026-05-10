
create database bank_loan;
use bank_loan;
select * from financial_loan;

-- Total Loan Application
select count(id) as Total_application from financial_loan;

-- Month wise loan application  
SELECT 
    MONTHNAME(issue_date) AS month_name,
    COUNT(*) AS total_loan_applications
FROM financial_loan
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

-- What is the total, minimum, maximum, and average funded loan amount across all loan applications?
SELECT 
    SUM(loan_amount) AS `Total Funded Amount`,
    MIN(loan_amount) AS `Minimum Funded Amount`,
    MAX(loan_amount) AS `Maximum Funded Amount`,
    AVG(loan_amount) AS `Average Funded Amount`
FROM financial_loan;

-- month wise total funded amount
SELECT 
    MONTHNAME(issue_date) AS month,
    sum(loan_amount) AS total_loan_amount
FROM
    financial_loan
GROUP BY MONTH(issue_date) , MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

-- What is the total, minimum, maximum, average, and number of loan payments received from customers?
select sum(total_payment) as `Total esive amount`,
min(total_payment) as `min resived amount`,
max(total_payment) as `max resived amount`,
avg(total_payment) as `ave resived amount`,
count(total_payment) as `Number of Payment`
 from financial_loan;

select * from financial_loan;
-- What are the total, minimum, and maximum loan payments received in December
	SELECT 
    SUM(total_payment) AS `Total Received Amount`,
    MIN(total_payment) AS `Minimum Payment`,
    MAX(total_payment) AS `Maximum Payment`
FROM financial_loan
WHERE MONTH(issue_date) = 12;

-- What is the average interest rate charged across all loan applications
SELECT 
    AVG(int_rate) * 100 AS average_interest_rate
FROM financial_loan;

-- What is the average Debt-to-Income (DTI) ratio across all loan applicants
SELECT 
    ROUND(AVG(dti) * 100, 2) AS average_dti_ratio
FROM financial_loan;

-- What percentage of total loans are classified as good loans
	SELECT 
    ROUND(
        (COUNT(
            CASE 
                WHEN loan_status IN ('Fully Paid', 'Current') 
                THEN id 
            END
        ) * 100.0) / COUNT(id), 
    2) AS good_loan_percentage
FROM financial_loan;

--  What percentage of total loans are classified as bad loans?
SELECT 
    ROUND(
        (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) 
        / COUNT(id), 2
    ) AS Bad_Loan_Percentage
FROM financial_loan;


--  How many loan applications are classified as good loans?
SELECT 
    COUNT(id) AS Good_Loan_Applications
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');


--  What is the total funded amount for good loans?
SELECT 
    SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');


--  What is the total amount received from good loans?
SELECT 
    SUM(total_payment) AS Good_Loan_Received_Amount
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');


--  How many loan applications are classified as bad loans?
SELECT 
    COUNT(id) AS Bad_Loan_Applications
FROM financial_loan
WHERE loan_status = 'Charged Off';


--  What is the total funded amount for bad loans?
SELECT 
    SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM financial_loan
WHERE loan_status = 'Charged Off';


--  What is the total amount received from bad loans?
SELECT 
    SUM(total_payment) AS Bad_Loan_Received_Amount
FROM financial_loan
WHERE loan_status = 'Charged Off';


--  What is the loan performance summary by loan status?
SELECT 
    loan_status AS Loan_Status,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount,
    ROUND(AVG(int_rate) * 100, 2) AS Average_Interest_Rate
FROM financial_loan
GROUP BY loan_status;


--  What is the month-wise loan application, funded amount, and received amount trend?
SELECT 
    MONTH(issue_date) AS Month_No,
    MONTHNAME(issue_date) AS Month_Name,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);


--  What is the state-wise loan application and funding analysis?
SELECT 
    address_state AS State,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY address_state
ORDER BY address_state;


--  What is the loan analysis based on loan term?
SELECT 
    term AS Loan_Term,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY term
ORDER BY term;


--  What is the loan analysis based on employee experience?
SELECT 
    emp_length AS Employee_Length,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;


--  What is the loan analysis based on loan purpose?
SELECT 
    purpose AS Loan_Purpose,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY purpose
ORDER BY purpose;


--  What is the loan analysis based on home ownership?
SELECT 
    home_ownership AS Home_Ownership,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership;









