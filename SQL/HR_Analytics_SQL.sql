CREATE TABLE hr_cleaned (
Age INT,
Attrition VARCHAR(20),
BusinessTravel VARCHAR(50),
DailyRate INT,
Department VARCHAR(100),
DistanceFromHome INT,
Education INT,
EducationField VARCHAR(100),
EmployeeCount INT,
EmployeeNumber INT,
EnvironmentSatisfaction INT,
Gender VARCHAR(20),
HourlyRate INT,
JobInvolvement INT,
JobLevel INT,
JobRole VARCHAR(100),
JobSatisfaction INT,
MaritalStatus VARCHAR(50),
MonthlyIncome INT,
MonthlyRate INT,
NumCompaniesWorked INT,
Over18 VARCHAR(10),
OverTime VARCHAR(20),
PercentSalaryHike INT,
PerformanceRating INT,
RelationshipSatisfaction INT,
StandardHours INT,
StockOptionLevel INT,
TotalWorkingYears INT,
TrainingTimesLastYear INT,
WorkLifeBalance INT,
YearsAtCompany INT,
YearsInCurrentRole INT,
YearsSinceLastPromotion INT,
YearsWithCurrManager INT,
AgeGroup VARCHAR(20),
IncomeSlab VARCHAR(20),
ExperienceGroup VARCHAR(20)
);

SELECT * FROM hr_cleaned;
-- Ten rows from the top


-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM hr_cleaned;
-- Total Employees : 1470



-- Overall Attrition Count & Rate
SELECT
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
COUNT(*) AS Total_Employees,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) AS Attrition_Rate
FROM hr_cleaned;

/*
EMPLOYEE LEFT : 237
TOTAL EMPLOYEES : 1470
OVERALL ATTRITION PERCENTAGE : 16 
*/



-- Attrition by Department
SELECT
Department,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) AS Attrition_Rate
FROM hr_cleaned
GROUP BY Department
ORDER BY Attrition_Rate DESC;
/*
SALES department loses the most employees.
*/



-- Attrition by Job Role
SELECT
JobRole,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Company
FROM hr_cleaned
GROUP BY JobRole
ORDER BY Left_Company DESC;


-- Average Monthly Income by Department
SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_cleaned
GROUP BY Department
ORDER BY Avg_Salary DESC;


-- Average Salary by Job Role
SELECT
JobRole,
ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income
FROM hr_cleaned
GROUP BY JobRole
ORDER BY Avg_Monthly_Income DESC;


-- Attrition by Gender
SELECT
Gender,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY Gender;


-- Attrition by Age Group
SELECT
AgeGroup,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY AgeGroup
ORDER BY AgeGroup;


--Attrition by Education Field
SELECT
EducationField,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY EducationField
ORDER BY Attrition DESC;


--Average Years at Company
SELECT
ROUND(AVG(YearsAtCompany),2) AS Avg_Years
FROM hr_cleaned;


--Employees by Marital Status
SELECT
MaritalStatus,
COUNT(*) AS Employees
FROM hr_cleaned
GROUP BY MaritalStatus;

-- Attrition by Marital Status
SELECT
MaritalStatus,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY MaritalStatus
ORDER BY Attrition DESC;


-- Average Job Satisfaction
SELECT
ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
FROM hr_cleaned;


-- Attrition by Job Satisfaction
SELECT
JobSatisfaction,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- Overtime vs Attrition
SELECT
OverTime,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) AS Attrition_Rate
FROM hr_cleaned
GROUP BY OverTime;


-- Average Monthly Income by Education
SELECT
Education,
ROUND(AVG(MonthlyIncome),2) AS Avg_Income
FROM hr_cleaned
GROUP BY Education
ORDER BY Avg_Income DESC;


-- Employees by Business Travel

SELECT
BusinessTravel,
COUNT(*) AS Employees
FROM hr_cleaned
GROUP BY BusinessTravel;


-- Attrition by Business Travel

SELECT
BusinessTravel,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY BusinessTravel
ORDER BY Attrition DESC;


-- Top 10 Highest Paid Employees
SELECT
EmployeeNumber,
JobRole,
Department,
MonthlyIncome
FROM hr_cleaned
ORDER BY MonthlyIncome DESC
LIMIT 10;


-- Employees with More Than 10 Years at Company
SELECT
EmployeeNumber,
Age,
Department,
JobRole,
YearsAtCompany
FROM hr_cleaned
WHERE YearsAtCompany > 10
ORDER BY YearsAtCompany DESC;


--Average Performance Rating by Department
SELECT
Department,
ROUND(AVG(PerformanceRating),2) AS Avg_Performance
FROM hr_cleaned
GROUP BY Department
ORDER BY Avg_Performance DESC;


-- Attrition by Environment Satisfaction
SELECT
EnvironmentSatisfaction,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;


-- Attrition by Work-Life Balance
SELECT
WorkLifeBalance,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM hr_cleaned
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


--Department-wise Salary Statistics
SELECT
Department,
MIN(MonthlyIncome) AS Min_Salary,
MAX(MonthlyIncome) AS Max_Salary,
ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_cleaned
GROUP BY Department;


-- Complete HR Summary
SELECT
COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
ROUND(AVG(Age),1) AS AvgAge,
ROUND(AVG(MonthlyIncome),0) AS AvgSalary,
ROUND(AVG(YearsAtCompany),1) AS AvgYearsAtCompany,
ROUND(AVG(JobSatisfaction),2) AS AvgJobSatisfaction
FROM hr_cleaned;



-- Employee Age Band using CASE WHEN
SELECT
EmployeeNumber,
Age,
CASE
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
END AS Age_Band
FROM hr_cleaned;



-- Salary Band Classification
SELECT
EmployeeNumber,
MonthlyIncome,
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low Salary'
    WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
    WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN 'High Salary'
    ELSE 'Very High Salary'
END AS Salary_Band
FROM hr_cleaned;


-- Department Attrition Summary using CTE
WITH DepartmentSummary AS
(
SELECT
Department,
COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS EmployeesLeft
FROM hr_cleaned
GROUP BY Department
)

SELECT *,
ROUND(EmployeesLeft*100/TotalEmployees,2) AS AttritionRate
FROM DepartmentSummary;


-- Rank Employees by Salary
SELECT
EmployeeNumber,
Department,
MonthlyIncome,
RANK() OVER(
ORDER BY MonthlyIncome DESC
) AS SalaryRank
FROM hr_cleaned;


-- Rank Salary Within Department
SELECT
EmployeeNumber,
Department,
MonthlyIncome,
RANK() OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS DepartmentSalaryRank
FROM hr_cleaned;



-- Dense Rank Salary
SELECT
EmployeeNumber,
Department,
MonthlyIncome,
DENSE_RANK() OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS DenseSalaryRank
FROM hr_cleaned;


-- Row Number Within Each Department
SELECT
EmployeeNumber,
Department,
MonthlyIncome,
ROW_NUMBER() OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS RowNum
FROM hr_cleaned;



-- Employees Earning Above Department Average
SELECT
EmployeeNumber,
Department,
MonthlyIncome
FROM hr_cleaned h
WHERE MonthlyIncome >
(
SELECT AVG(MonthlyIncome)
FROM hr_cleaned
WHERE Department=h.Department
);


-- Employees with Maximum Salary in Each Department
SELECT
EmployeeNumber,
Department,
MonthlyIncome
FROM hr_cleaned h
WHERE MonthlyIncome=
(
SELECT MAX(MonthlyIncome)
FROM hr_cleaned
WHERE Department=h.Department
);


--Departments Having More Than 20 Attritions
SELECT
Department,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_cleaned
GROUP BY Department
HAVING SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) > 20;


--Department-wise Attrition Percentage
SELECT
Department,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS LeftCompany,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) AS AttritionRate
FROM hr_cleaned
GROUP BY Department
ORDER BY AttritionRate DESC;


--Running Total of Monthly Income
SELECT
EmployeeNumber,
MonthlyIncome,
SUM(MonthlyIncome)
OVER(
ORDER BY EmployeeNumber
) AS RunningSalaryTotal
FROM hr_cleaned;


--Average Salary by Department Using Window Function
SELECT
EmployeeNumber,
Department,
MonthlyIncome,
ROUND(
AVG(MonthlyIncome)
OVER(PARTITION BY Department),
2
) AS DepartmentAverageSalary
FROM hr_cleaned;


