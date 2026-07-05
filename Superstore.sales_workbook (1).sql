## 1Preview Dataset

SELECT *
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
LIMIT 10;

## 2Total Rows
SELECT COUNT(*) AS total_rows
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`;

-- ## 3change culmn name
-- ALTER TABLE `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
-- RENAME COLUMN `Customer Name` TO Customer_Name;

## 4Check Missing Values

SELECT
  COUNTIF(Sales IS NULL) AS null_sales,
  COUNTIF(Profit IS NULL) AS null_profit,
  COUNTIF(Customer_Name IS NULL) AS null_customers
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`;

## 5 KPI ANALYSIS (Total sales)

SELECT
  ROUND(SUM(Sales),2) AS total_sales
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`;

## 6Total profit

SELECT
  ROUND(SUM(Profit),2) AS total_profit
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`;

## 7Total orders
SELECT
  COUNT(DISTINCT Order_ID) AS total_orders
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`;

## 8change culmn name
-- ALTER TABLE `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
-- RENAME COLUMN `Order ID` TO Order_ID;

## 9Total Customers

SELECT
  COUNT(DISTINCT Customer_Name) AS total_customers
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`;

## 10Sales by Region

SELECT
  Region,
  ROUND(SUM(Sales),2) AS total_sales
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY Region
ORDER BY total_sales DESC;

## 11Profit by Region

SELECT
  Region,
  ROUND(SUM(Profit),2) AS total_profit
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY Region
ORDER BY total_profit DESC;

## 12Sales by Category

SELECT
  Category,
  ROUND(SUM(Sales),2) AS total_sales
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY Category
ORDER BY total_sales DESC;

## 13Profit by Category

SELECT
  Category,
  ROUND(SUM(Profit),2) AS total_profit
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY Category
ORDER BY total_profit DESC;

## 14Top Products by Sales

SELECT
  Product_Name,
  ROUND(SUM(Sales),2) AS sales
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY Product_Name
ORDER BY sales DESC
LIMIT 10;


## 15change culmn name

-- ALTER TABLE `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
-- RENAME COLUMN `Product Name` TO Product_Name;

## 16Loss-Making Products

SELECT
  Product_Name,
  ROUND(SUM(Profit),2) AS total_loss
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY Product_Name
HAVING total_loss < 0
ORDER BY total_loss;


## 17Monthly Sales Trend

SELECT
  FORMAT_DATE('%Y-%m', Order_Date) AS month,
  ROUND(SUM(Sales),2) AS monthly_sales
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY month
ORDER BY month;

-- ALTER TABLE `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
-- RENAME COLUMN `Order Date` TO Order_Date;

## 18Monthly Profit Trend
SELECT
  FORMAT_DATE('%Y-%m', Order_Date) AS month,
  ROUND(SUM(Profit),2) AS monthly_profit
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY month
ORDER BY month;



-- ALTER TABLE `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
-- RENAME COLUMN `State_Province` TO State;

##State performance
SELECT
  `State`,
  ROUND(SUM(Sales),2) AS total_sales,
  ROUND(SUM(Profit),2) AS total_profit
FROM `project-77440cb5-d66b-4816-9cf.sales_analysis.superstore_sales`
GROUP BY `State`
ORDER BY total_sales DESC;




