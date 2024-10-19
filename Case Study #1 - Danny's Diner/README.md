# CASE STUDY #1 - DANNY'S DINER

![image](https://github.com/user-attachments/assets/ce374cce-c9c3-447c-be97-9c42d65b054e)

# INTRODUCTION

Danny's Diner, a charming restaurant launched in early 2021 by culinary enthusiast Danny, specializes in his three favorite Japanese dishes: sushi, curry, and ramen. Despite its appealing concept, the diner faces challenges in its initial months, struggling to leverage the basic sales data it has collected. This case study examines the current operational hurdles faced by Danny's Diner and explores strategies to utilize data-driven insights for improving efficiency, enhancing customer satisfaction, and ensuring long-term success in a competitive market.

# BUSINESS PROBLEM

Danny's Diner, a newly established restaurant specializing in Japanese cuisine, is struggling to optimize its operations and enhance customer experience due to a lack of actionable insights from its customer data. The diner has collected some basic sales information, but it does not know how to analyze this data effectively to answer critical questions about customer behavior.

**Key Challenges**:

**1. Understanding Customer Behavior**: Danny lacks insight into customer visiting patterns, spending habits, and preferences for menu items. Without this understanding, it's difficult to tailor services or offerings to meet customer needs effectively.

**2. Loyalty Program Effectiveness**: Danny is unsure if the current customer loyalty program is meeting its goals or if it should be expanded. There is insufficient data to evaluate customer engagement and spending trends related to loyalty program members.

**3. Data Utilization**: Although basic datasets exist (sales, menu, members), Danny's team lacks the expertise to analyze this data without requiring complex SQL queries, hindering their ability to derive actionable insights.

# OBJECTIVE

To address these challenges, Danny aims to:

1. Analyze customer data to uncover insights about visiting patterns, spending, and popular menu items.
2. Use these insights to enhance customer experience and potentially expand the existing loyalty program.
3. Generate simplified datasets for easier inspection by his team, enabling more effective decision-making.
   
# AVAILABLE DATASET

For this case study there are three tables: *dannys_diner.sales*, *dannys_diner.menu*, *dannys_diner.members*

**a. SALES DATASET**

The **sales table** captures all **customer_id** level purchases with an corresponding **order_date** and **product_id** information for when and what menu items were ordered.

![image](https://github.com/user-attachments/assets/9093a29a-d10b-40b1-8fb8-862cfda9dd90)

**b. MENU DATASET**

The **menu table** maps the product_id to the actual **product_name** and **price** of each menu item.

![image](https://github.com/user-attachments/assets/5d79d877-7806-489a-abe5-669535d8b52d)

**c. MEMBERS DATASET**

The final **members table** captures the **join_date** when a **customer_id** joined the beta version of the Danny’s Diner loyalty program.

![image](https://github.com/user-attachments/assets/8dfff157-05e1-44b5-a126-c824a557ef5a)

# ENTITY RELATIONSHIP DIAGRAM

![image](https://github.com/user-attachments/assets/10a5a471-b616-44f5-9bb8-e1c1b28bd1d6)

# RESOURCES

1. [8 Week SQL Challenge](https://8weeksqlchallenge.com/) - Official website with all case studies.
2. [Case Study #1 - Danny's Diner](https://8weeksqlchallenge.com/case-study-1/) - Direct link to the case study details.
