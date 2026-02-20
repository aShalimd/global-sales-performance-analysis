Select * from sales_India

SELECT *
INTO Global_Sales_Data
FROM sales_India
UNION ALL
SELECT * FROM sales_China
UNION ALL
SELECT * FROM sales_UK
UNION ALL
SELECT * FROM sales_US
UNION ALL
SELECT * FROM sales_Canada
UNION ALL
SELECT * FROM sales_Nigeria;


select * from Global_Sales_Data


