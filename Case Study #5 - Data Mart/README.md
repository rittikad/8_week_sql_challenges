# CASE STUDY #5 - DATA MART

<img width="361" alt="image" src="https://github.com/user-attachments/assets/69b79fc3-a390-48c2-87c3-76fcb8b67dc5">

This case study focuses on building and analyzing a data mart— a specialized database designed to support business decisions by consolidating and organizing data for specific analytical purposes.

# BUSINESS PROBLEM

Data Mart is Danny’s latest venture and after running international operations for his online supermarket that specialises in fresh produce - Danny is asking for your support to analyse his sales performance.

In June 2020 - large scale supply changes were made at Data Mart. All Data Mart products now use sustainable packaging methods in every single step from the farm all the way to the customer.

Danny needs your help to quantify the impact of this change on the sales performance for Data Mart and it’s separate business areas.

The key business question he wants you to help him answer are the following:

What was the quantifiable impact of the changes introduced in June 2020?
Which platform, region, segment and customer types were the most impacted by this change?
What can we do about future introduction of similar sustainability updates to the business to minimise impact on sales?

# OBJECTIVE

The main objectives of this case study are:
1. Design a Data Mart: Create a data mart schema that efficiently organizes data for business analysis.
2. Implement ETL Processes: Develop ETL (Extract, Transform, Load) procedures to populate the data mart with relevant data.
3. Analyze Data with SQL: Write SQL queries to extract insights, identify trends, and generate reports that support business decision-making.
# AVAILABLE DATA

For this case study there is only a single table: data_mart.weekly_sales

# ENTITY RELATIONSHIP DIAGRAM

![image](https://github.com/user-attachments/assets/b33b0759-e9cd-4e3d-a3ef-e4c361cdd6aa)


# COLUMN DICTIONARY

The columns are pretty self-explanatory based on the column names but here are some further details about the dataset:

1. Data Mart has international operations using a multi-region strategy.
2. Data Mart has both, a retail and online platform in the form of a Shopify store front to serve their customers.
3. Customer segment and customer_type data relates to personal age and demographics information that is shared with Data Mart.
4. transactions is the count of unique purchases made through Data Mart and sales is the actual dollar amount of purchases.

Each record in the dataset is related to a specific aggregated slice of the underlying sales data rolled up into a week_date value which represents the start of the sales week.

# RESOURCES

1. [8 Week SQL Challenge](https://8weeksqlchallenge.com/) - Official website with all case studies.
2. [Case Study 5: Data Mart](https://8weeksqlchallenge.com/case-study-5/) - Direct link to the case study details.







