USE retail_banking;

SELECT 
    Age_Bracket,
    Wealth_Tier,
    COUNT(CustomerId) AS Customer_Count,
    ROUND(SUM(Exited) * 100.0 / COUNT(CustomerId), 2) AS Churn_Rate_Pct,
    ROUND(SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END), 2) AS Lost_AUM_USD
FROM bank_churn
GROUP BY Age_Bracket, Wealth_Tier
ORDER BY Lost_AUM_USD DESC;

USE retail_banking;

SELECT 
    NumOfProducts,
    CASE 
        WHEN IsActiveMember = 1 THEN 'Active Member' 
        ELSE 'Inactive Member' 
    END AS Membership_Status,
    COUNT(CustomerId) AS Total_Accounts,
    ROUND(AVG(Balance), 2) AS Avg_Balance,
    ROUND(AVG(Exited) * 100.0, 2) AS Churn_Rate_Pct,
    ROUND(SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END), 2) AS Lost_AUM_USD
FROM bank_churn
GROUP BY NumOfProducts, IsActiveMember
ORDER BY NumOfProducts ASC, IsActiveMember DESC;

USE retail_banking;

SELECT 
    Geography,
    COUNT(CustomerId) AS Total_Customers,
    ROUND(SUM(Balance), 2) AS Total_AUM,
    ROUND(SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END), 2) AS Lost_AUM,
    ROUND(SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END) * 100.0 / SUM(Balance), 2) AS AUM_Loss_Pct,
    ROUND(AVG(Exited) * 100.0, 2) AS Customer_Churn_Pct
FROM bank_churn
GROUP BY Geography
ORDER BY Lost_AUM DESC;