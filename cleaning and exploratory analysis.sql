select *
from sales_and_customer_insights
;

create table sales_and_customer_insights1
like sales_and_customer_insights
;

insert sales_and_customer_insights1
select *
from sales_and_customer_insights
;

select *
from sales_and_customer_insights1;

select * ,
row_number() over(partition by customer_id,product_id,transaction_id,Purchase_Frequency,Average_Order_Value,
Most_Frequent_Category,Time_Between_Purchases,Region,Churn_Probability,Lifetime_Value,Launch_Date,Peak_Sales_Date,
Season,Preferred_Purchase_Times,Retention_Strategy) as row_num
from sales_and_customer_insights1
;

with check_de as
(
select * ,
row_number() over(partition by customer_id,product_id,transaction_id,Purchase_Frequency,Average_Order_Value,
Most_Frequent_Category,Time_Between_Purchases,Region,Churn_Probability,Lifetime_Value,Launch_Date,Peak_Sales_Date,
Season,Preferred_Purchase_Times,Retention_Strategy) as row_num
from sales_and_customer_insights1
)
select *
from check_de
where row_num > 1
;

select distinct(region)
from sales_and_customer_insights1
;

select distinct(Most_Frequent_Category)
from sales_and_customer_insights1
;

select distinct(Season)
from sales_and_customer_insights1
;

select distinct(Season)
from sales_and_customer_insights1
;

select distinct(Preferred_Purchase_Times)
from sales_and_customer_insights1
;

select distinct(Retention_Strategy)
from sales_and_customer_insights1
;

select *
from sales_and_customer_insights1
where  COALESCE( customer_id,product_id,transaction_id,Purchase_Frequency,Average_Order_Value,
Most_Frequent_Category,Time_Between_Purchases,Region,
Churn_Probability,Lifetime_Value,Launch_Date,Peak_Sales_Date,
Season,Preferred_Purchase_Times,Retention_Strategy) is null 
;

SELECT *
FROM sales_and_customer_insights1
WHERE customer_id = ''
   OR product_id = ''
   OR transaction_id = ''
   OR Purchase_Frequency = ''
   OR Average_Order_Value = ''
   OR Most_Frequent_Category = ''
   OR Time_Between_Purchases = ''
   OR Region = ''
   OR Churn_Probability = ''
   OR Lifetime_Value = ''
   OR Launch_Date = ''
   OR Peak_Sales_Date = ''
   OR Season = ''
   OR Preferred_Purchase_Times = ''
   OR Retention_Strategy = ''
   ;
   
SELECT *
FROM sales_and_customer_insights1;


-- exploratory data analysis

SELECT *
FROM sales_and_customer_insights1
;

SELECT MAX(purchase_frequency) as max_frequency,min(purchase_frequency) min_frequency 
from sales_and_customer_insights1
;

select Most_Frequent_Category,Purchase_Frequency,season
from sales_and_customer_insights1
order by Purchase_Frequency  desc,season
;

select Average_Order_Value,season,Most_Frequent_Category,Region
from sales_and_customer_insights1
order by  Average_Order_Value desc
;

select Region,Purchase_Frequency,Most_Frequent_Category,
season,Average_Order_Value
from sales_and_customer_insights1
where region = 'north america'
order by Average_Order_Value desc
;

select Region,Purchase_Frequency,Most_Frequent_Category,season,Average_Order_Value
from sales_and_customer_insights1
where region = 'South America'
order by Average_Order_Value desc
;

select Region,Purchase_Frequency,Most_Frequent_Category,
season,Average_Order_Value
from sales_and_customer_insights1
where region = 'Asia'
order by Average_Order_Value desc
;

select Region,Purchase_Frequency,Most_Frequent_Category,season,Average_Order_Value
from sales_and_customer_insights1
where region = 'Europe'
order by Average_Order_Value desc
;

select Region,Retention_Strategy,count(Customer_ID)
from sales_and_customer_insights1
group by Region, Retention_Strategy
order by Region, Retention_Strategy
;

with retention as 
(
select Region,Retention_Strategy,count(Customer_ID) as count 
from sales_and_customer_insights1
group by Region, Retention_Strategy
order by Region, Retention_Strategy
)
select *
from retention 
where region = 'asia'
;

with retention as 
(
select Region,Retention_Strategy,count(Customer_ID) as count 
from sales_and_customer_insights1
group by Region, Retention_Strategy
order by Region, Retention_Strategy
)
select *
from retention 
where region = 'north america'
;

with retention as 
(
select Region,Retention_Strategy,count(Customer_ID) as count 
from sales_and_customer_insights1
group by Region, Retention_Strategy
order by Region, Retention_Strategy
)
select *
from retention 
where region = 'south america'
;

with retention as 
(
select Region,Retention_Strategy,count(Customer_ID) as count 
from sales_and_customer_insights1
group by Region, Retention_Strategy
order by Region, Retention_Strategy
)
select *
from retention 
where region = 'europe'
;

SELECT *
FROM sales_and_customer_insights1
;

select Retention_Strategy,count(Customer_ID) as count 
from sales_and_customer_insights1
group by  Retention_Strategy
order by  Retention_Strategy
;

select Most_Frequent_Category,Lifetime_Value
from sales_and_customer_insights1
order by  Lifetime_Value desc
;

select datediff( Peak_Sales_Date,Launch_Date) as days_to_peak,
Most_Frequent_Category,region,Product_ID,Average_Order_Value
from sales_and_customer_insights1
where region = 'asia'
order by days_to_peak 
;

select datediff( Peak_Sales_Date,Launch_Date) as days_to_peak,
Most_Frequent_Category,region,Product_ID,Average_Order_Value
from sales_and_customer_insights1
where region = 'south america'
order by days_to_peak 
;

select datediff( Peak_Sales_Date,Launch_Date) as days_to_peak,
Most_Frequent_Category,region,Product_ID,Average_Order_Value
from sales_and_customer_insights1
where region = 'north america'
order by days_to_peak 
;

select datediff( Peak_Sales_Date,Launch_Date) as days_to_peak,
Most_Frequent_Category,region,Product_ID,Average_Order_Value
from sales_and_customer_insights1
where region = 'europe'
order by days_to_peak 
;


