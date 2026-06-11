select * from ecommerce_customer_churn_dataset;
-- data cleaning 
-- sql how to do data cleaning
-- if the column is numercial then we prefer to replace null by mean or median and if its categorical then by some text
-- how to see null values and replace them 
select * from ecommerce_customer_churn_dataset;
-- checking data for missing values 
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Missing,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Missing,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Country_Missing,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS City_Missing,
    SUM(CASE WHEN Membership_Years IS NULL THEN 1 ELSE 0 END) AS Membership_Years_Missing,
    SUM(CASE WHEN Login_Frequency IS NULL THEN 1 ELSE 0 END) AS Login_Frequency_Missing,
    SUM(CASE WHEN Session_Duration_Avg IS NULL THEN 1 ELSE 0 END) AS Session_Duration_Missing,
    SUM(CASE WHEN Pages_Per_Session IS NULL THEN 1 ELSE 0 END) AS Pages_Per_Session_Missing,
    SUM(CASE WHEN Cart_Abandonment_Rate IS NULL THEN 1 ELSE 0 END) AS Cart_Abandonment_Missing,
    SUM(CASE WHEN Wishlist_Items IS NULL THEN 1 ELSE 0 END) AS Wishlist_Items_Missing,
    SUM(CASE WHEN Total_Purchases IS NULL THEN 1 ELSE 0 END) AS Total_Purchases_Missing,
    SUM(CASE WHEN Average_Order_Value IS NULL THEN 1 ELSE 0 END) AS Avg_Order_Value_Missing,
    SUM(CASE WHEN Days_Since_Last_Purchase IS NULL THEN 1 ELSE 0 END) AS Days_Since_Last_Purchase_Missing,
    SUM(CASE WHEN Discount_Usage_Rate IS NULL THEN 1 ELSE 0 END) AS Discount_Usage_Missing,
    SUM(CASE WHEN Returns_Rate IS NULL THEN 1 ELSE 0 END) AS Returns_Rate_Missing,
    SUM(CASE WHEN Email_Open_Rate IS NULL THEN 1 ELSE 0 END) AS Email_Open_Rate_Missing,
    SUM(CASE WHEN Customer_Service_Calls IS NULL THEN 1 ELSE 0 END) AS Customer_Service_Calls_Missing,
    SUM(CASE WHEN Product_Reviews_Written IS NULL THEN 1 ELSE 0 END) AS Reviews_Missing,
    SUM(CASE WHEN Social_Media_Engagement_Score IS NULL THEN 1 ELSE 0 END) AS Social_Media_Missing,
    SUM(CASE WHEN Mobile_App_Usage IS NULL THEN 1 ELSE 0 END) AS Mobile_App_Usage_Missing,
    SUM(CASE WHEN Payment_Method_Diversity IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Missing,
    SUM(CASE WHEN Lifetime_Value IS NULL THEN 1 ELSE 0 END) AS Lifetime_Value_Missing,
    SUM(CASE WHEN Credit_Balance IS NULL THEN 1 ELSE 0 END) AS Credit_Balance_Missing,
    SUM(CASE WHEN Churned IS NULL THEN 1 ELSE 0 END) AS Churned_Missing,
    SUM(CASE WHEN Signup_Quarter IS NULL THEN 1 ELSE 0 END) AS Signup_Quarter_Missing
FROM ecommerce_customer_churn_dataset;
-- replcaing the missing values 
UPDATE ecommerce_customer_churn_dataset
SET
    Age = ISNULL(Age,(SELECT AVG(Age) FROM ecommerce_customer_churn_dataset)),
    Membership_Years = ISNULL(Membership_Years,(SELECT AVG(Membership_Years) FROM ecommerce_customer_churn_dataset)),
    Login_Frequency = ISNULL(Login_Frequency,(SELECT AVG(Login_Frequency) FROM ecommerce_customer_churn_dataset)),
    Session_Duration_Avg = ISNULL(Session_Duration_Avg,(SELECT AVG(Session_Duration_Avg) FROM ecommerce_customer_churn_dataset)),
    Pages_Per_Session = ISNULL(Pages_Per_Session,(SELECT AVG(Pages_Per_Session) FROM ecommerce_customer_churn_dataset)),
    Cart_Abandonment_Rate = ISNULL(Cart_Abandonment_Rate,(SELECT AVG(Cart_Abandonment_Rate) FROM ecommerce_customer_churn_dataset)),
    Wishlist_Items = ISNULL(Wishlist_Items,(SELECT AVG(Wishlist_Items) FROM ecommerce_customer_churn_dataset)),
    Total_Purchases = ISNULL(Total_Purchases,(SELECT AVG(Total_Purchases) FROM ecommerce_customer_churn_dataset)),
    Average_Order_Value = ISNULL(Average_Order_Value,(SELECT AVG(Average_Order_Value) FROM ecommerce_customer_churn_dataset)),
    Days_Since_Last_Purchase = ISNULL(Days_Since_Last_Purchase,(SELECT AVG(Days_Since_Last_Purchase) FROM ecommerce_customer_churn_dataset)),
    Discount_Usage_Rate = ISNULL(Discount_Usage_Rate,(SELECT AVG(Discount_Usage_Rate) FROM ecommerce_customer_churn_dataset)),
    Returns_Rate = ISNULL(Returns_Rate,(SELECT AVG(Returns_Rate) FROM ecommerce_customer_churn_dataset)),
    Email_Open_Rate = ISNULL(Email_Open_Rate,(SELECT AVG(Email_Open_Rate) FROM ecommerce_customer_churn_dataset)),
    Customer_Service_Calls = ISNULL(Customer_Service_Calls,(SELECT AVG(Customer_Service_Calls) FROM ecommerce_customer_churn_dataset)),
    Product_Reviews_Written = ISNULL(Product_Reviews_Written,(SELECT AVG(Product_Reviews_Written) FROM ecommerce_customer_churn_dataset)),
    Social_Media_Engagement_Score = ISNULL(Social_Media_Engagement_Score,(SELECT AVG(Social_Media_Engagement_Score) FROM ecommerce_customer_churn_dataset)),
    Mobile_App_Usage = ISNULL(Mobile_App_Usage,(SELECT AVG(Mobile_App_Usage) FROM ecommerce_customer_churn_dataset)),
    Payment_Method_Diversity = ISNULL(Payment_Method_Diversity,(SELECT AVG(Payment_Method_Diversity) FROM ecommerce_customer_churn_dataset)),
    Lifetime_Value = ISNULL(Lifetime_Value,(SELECT AVG(Lifetime_Value) FROM ecommerce_customer_churn_dataset)),
    Credit_Balance = ISNULL(Credit_Balance,(SELECT AVG(Credit_Balance) FROM ecommerce_customer_churn_dataset)),
    Gender = ISNULL(Gender,'Not Defined'),
    Country = ISNULL(Country,'Not Defined'),
    City = ISNULL(City,'Not Defined');
    select * from ecommerce_customer_churn_dataset;
    -- checking duplicates 
    select *,
    count(*) as duplicate_count 
    from ecommerce_customer_churn_dataset
    group by 
    Age,
    Gender,
    Country,
    City,
    Membership_Years,
    Login_Frequency,
    Session_Duration_Avg,
    Pages_Per_Session,
    Cart_Abandonment_Rate,
    Wishlist_Items,
    Total_Purchases,
    Average_Order_Value,
    Days_Since_Last_Purchase,
    Discount_Usage_Rate,
    Returns_Rate,
    Email_Open_Rate,
    Customer_Service_Calls,
    Product_Reviews_Written,
    Social_Media_Engagement_Score,
    Mobile_App_Usage,
    Payment_Method_Diversity,
    Lifetime_Value,
    Credit_Balance,
    Churned,
    Signup_Quarter
    having count(*)>1;
select * from ecommerce_customer_churn_dataset;
-- analysis 
-- overall churn rate
-- convert bit to int
-- churn ratio of total customers and churned ones 
select count(*) as total_Customers,
sum(cast(Churned as int )) as churned_customers
from ecommerce_customer_churn_dataset;
-- churn rate 
select 
round(
100.0*sum(cast(Churned as int))/count(*),
2
) as churn_Rate
from ecommerce_customer_churn_dataset;

-- chrun by gender
select gender ,
count(*) as customers,
sum(cast(Churned as int)) as churned_Customers,
round(
100.0*sum(cast(churned as int))/count(*),
2
) as churn_Rate
from ecommerce_customer_churn_dataset
group by gender;