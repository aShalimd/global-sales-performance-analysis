
Select * from Global_Sales_data

-- Checks Null is Data
Select * from 
Global_Sales_data
where
 Country is NULL

 or Category is NULL
 or price_per_unit is NULL
 or Quantity_Purchased is NULL
 or Cost_Price is NULL
 or Discount_Applied is Null


-- Update Value in Quantity Purchased
update Global_sales_data
set Quantity_Purchased = 3 
Where Transaction_ID = '00a30472-89a0-4688-9d33-67ea8ccf7aea'


-- Update Value in Price Per Unit
UPDATE Global_Sales_Data
SET Price_Per_Unit = (
    SELECT AVG(Price_Per_Unit)
    FROM Global_Sales_Data
    WHERE Price_Per_Unit IS NOT NULL
)
WHERE LTRIM(RTRIM(Transaction_ID)) = '95e49860-f77d-4598-a078-098a8c570147';


                                                               
-- Update Value in Discount_Applied
UPDATE Global_Sales_Data
SET Discount_Applied = Price_Per_Unit * 0.10
WHERE Discount_Applied IS NULL;

-- Adding the Total_price Column in Table
Alter table Global_Sales_Data 
add Total_Price numeric(10,2)

-- Updating value in Total_price
update Global_Sales_data
set Total_price = price_per_unit * Quantity_purchased - Discount_applied

-- Adding the Profit Column in Table
alter table Global_Sales_Data
add Profit numeric(10,2)

-- Updating value in profit
update Global_Sales_data
set profit = (Total_price - Cost_price) * Quantity_Purchased\

--Sum of Total_price and profit 
Select 
country,
sum(Total_price) Total_Revenue,
sum(profit) Total_Profit
from Global_Sales_data
group by country

 
--Top 5 product 
Select top 5
product_Name,
sum(Quantity_Purchased) as Total_unit_sold
from Global_Sales_Data
where date between '2025-02-10' and '2025-04-14'
group by product_name
order by Total_unit_sold desc


-- Top 5 Sales_Rep
select top 5 
Sales_Rep,
sum(Total_Price) as Total_Sales
from Global_Sales_Data
where date between '2025-02-10' and '2025-04-14'
Group by Sales_Rep
order by Total_sales desc 


-- Top 5 Store_Location
Select top 5
Store_Location,
Sum(Total_Price) as Total_Price,
Sum(Profit) as Total_Profit
from Global_Sales_Data
Group by Store_Location
order by Total_price desc

--Key Values and Profit
select
	min(Total_price) as Min_Sales_Value,
	max(Total_price) as Max_Sales_Value,
	Avg(Total_price) as Avg_Sales_Value,
	sum(Total_price) as Sum_Sales_Value,
	min(profit) as Min_Profit_Value,
	max(profit) as Max_Profit_Value,
	Avg(profit) as Avg_Profit_Value,
	sum(profit) as Sum_Profit_Value
from Global_Sales_Data