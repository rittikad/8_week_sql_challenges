CASE STUDY #1 - DANNY'S DINER
![image](https://github.com/user-attachments/assets/0cf07f82-45c8-4f0f-b7a6-43e6c9b6d288)

Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.

Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.

BUSINESS PROBLEM
Data Mart is Danny’s latest venture and after running international operations for his online supermarket that specialises in fresh produce - Danny is asking for your support to analyse his sales performance.

In June 2020 - large scale supply changes were made at Data Mart. All Data Mart products now use sustainable packaging methods in every single step from the farm all the way to the customer.

Danny needs your help to quantify the impact of this change on the sales performance for Data Mart and it’s separate business areas.

The key business question he wants you to help him answer are the following:

What was the quantifiable impact of the changes introduced in June 2020? Which platform, region, segment and customer types were the most impacted by this change? What can we do about future introduction of similar sustainability updates to the business to minimise impact on sales?

OBJECTIVE
The main objectives of this case study are:

Design a Data Mart: Create a data mart schema that efficiently organizes data for business analysis.
Implement ETL Processes: Develop ETL (Extract, Transform, Load) procedures to populate the data mart with relevant data.
Analyze Data with SQL: Write SQL queries to extract insights, identify trends, and generate reports that support business decision-making.
AVAILABLE DATA
For this case study there is only a single table: data_mart.weekly_sales

ENTITY RELATIONSHIP DIAGRAM
image

COLUMN DICTIONARY
The columns are pretty self-explanatory based on the column names but here are some further details about the dataset:

Data Mart has international operations using a multi-region strategy.
Data Mart has both, a retail and online platform in the form of a Shopify store front to serve their customers.
Customer segment and customer_type data relates to personal age and demographics information that is shared with Data Mart.
transactions is the count of unique purchases made through Data Mart and sales is the actual dollar amount of purchases.
Each record in the dataset is related to a specific aggregated slice of the underlying sales data rolled up into a week_date value which represents the start of the sales week.

RESOURCES
8 Week SQL Challenge - Official website with all case studies.
Case Study 5: Data Mart - Direct link to the case study details.
