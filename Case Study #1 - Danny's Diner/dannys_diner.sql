/* =====================================================
   Danny's Diner - SQL Case Study
   ===================================================== */

/* =====================================================
   Q1: Total amount each customer spent
   ===================================================== */
SELECT 
    customer_id, SUM(price) AS total_amount
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY customer_id;

-- Output:
-- +-------------+--------------+
-- | customer_id | total_amount |
-- +-------------+--------------+
-- | C           | 36         |
-- | B           | 74         |
-- | A           | 76          |
-- +-------------+--------------+

/* =====================================================
   Q2: Number of days each customer visited
   ===================================================== */
SELECT 
    customer_id, COUNT(DISTINCT order_date) AS customer_visit
FROM sales
GROUP BY customer_id;

-- Output:
-- +-------------+----------------+
-- | customer_id | customer_visit |
-- +-------------+----------------+
-- | A           | 4              |
-- | B           | 6              |
-- | C           | 2              |
-- +-------------+----------------+

/* =====================================================
   Q3: First item purchased by each customer
   ===================================================== */
WITH FirstPurchase AS
(
	SELECT 
		customer_id, 
		product_name,
        order_date,
		DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_ranking
	FROM sales s
	JOIN menu m ON s.product_id = m.product_id
)
SELECT
	DISTINCT product_name,
	customer_id, 
    order_date
FROM FirstPurchase
WHERE order_ranking = 1;

-- Output:
-- +-------------+-------------+------------+
-- | product_name| customer_id | order_date |
-- +-------------+-------------+------------+
-- |sushi		 |	A		   |2021-01-01 |
-- |curry		 |	A		   |2021-01-01 |
-- |curry		 |	B		   |2021-01-01 |
-- |ramen		 |	C		   |2021-01-01 |
-- +-------------+-------------+------------+

/* =====================================================
   Q4: Most purchased item on the menu
   ===================================================== */
SELECT 
    product_name, 
    COUNT(s.product_id) AS most_purchased_item
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY product_name
ORDER BY most_purchased_item DESC
LIMIT 1;

-- Output:
-- +-------------+---------------------+
-- | product_name| most_purchased_item |
-- +-------------+---------------------+
-- | 	ramen    | 	 8                 |
-- +-------------+---------------------+

/* =====================================================
   Q5: Most popular item for each customer
   ===================================================== */
WITH MostPopularItem AS
(
	SELECT 
		customer_id,
        product_name,
        DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(product_name) DESC) AS product_count_ranking
	FROM sales s
	JOIN menu m ON s.product_id = m.product_id
    GROUP BY 1,2
)
SELECT 
	customer_id,
	product_name
FROM MostPopularItem
WHERE product_count_ranking = 1;

-- Output:
-- +-------------+-------------+
-- | customer_id | product_name|
-- +-------------+-------------+
-- |A			 |	ramen	   |
-- |B			 |	curry	   |
-- |B			 |	sushi	   |
-- |B			 |	ramen	   |
-- |C			 |	ramen	   |
-- +-------------+-------------+

/* =====================================================
   Q6: First item purchased after becoming a member
   ===================================================== */
WITH FirstPurAfterMember AS
(
	SELECT 
		s.customer_id, 
		product_name, 
        order_date,
        join_date,
		DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY join_date, order_date) AS purchase_ranking
	FROM sales s
	JOIN members m ON s.customer_id = m.customer_id
	JOIN menu mu ON s.product_id = mu.product_id
	WHERE order_date >= join_date
)
SELECT *
FROM FirstPurAfterMember
WHERE purchase_ranking = 1;

-- Output:
-- +-------------+-------------+------------+------------+----------------+
-- | customer_id | product_name| order_date | join_date  | purchase_ranking|
-- +-------------+-------------+------------+------------+----------------+
-- | A           | curry       | 2021-01-07 | 2021-01-07 | 1              |
-- | A           | ramen       | 2021-01-10 | 2021-01-07 | 2              |
-- | A           | ramen       | 2021-01-11 | 2021-01-07 | 3              |
-- | A           | ramen       | 2021-01-11 | 2021-01-07 | 3              |
-- | B           | sushi       | 2021-01-11 | 2021-01-09 | 1              |
-- | B           | ramen       | 2021-01-16 | 2021-01-09 | 2              |
-- | B           | ramen       | 2021-02-01 | 2021-01-09 | 3              |
-- +-------------+-------------+------------+------------+----------------+

/* =====================================================
   Q7: Item purchased just before becoming a member
   ===================================================== */
WITH LastPurBeforeMember AS
(
	SELECT 
		s.customer_id, 
		product_name, 
        order_date,
        join_date,
		DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY join_date, order_date DESC) AS purchase_ranking
	FROM sales s
	JOIN members m ON s.customer_id = m.customer_id
	JOIN menu mu ON s.product_id = mu.product_id
    WHERE order_date < join_date
)
SELECT 
	customer_id, 
	product_name
FROM LastPurBeforeMember
WHERE purchase_ranking = 1;

-- Output:
-- +-------------+-------------+
-- | customer_id | product_name|
-- +-------------+-------------+
-- | A           | sushi       |
-- | A           | curry       |
-- | B           | sushi       |
-- +-------------+-------------+

/* =====================================================
   Q8: Total items and amount spent before becoming a member
   ===================================================== */
WITH TotalItemAmountBeforeMember AS
(
	SELECT 
		s.customer_id,
        COUNT(*) AS total_items, 
        SUM(price) AS total_amount
	FROM sales s
	JOIN members m ON s.customer_id = m.customer_id
	JOIN menu mu ON s.product_id = mu.product_id
    WHERE order_date < join_date
    GROUP BY s.customer_id
)
SELECT *
FROM TotalItemAmountBeforeMember;

-- Output:
-- +-------------+------------+-------------+
-- | customer_id | total_items| total_amount|
-- +-------------+------------+-------------+
-- | B           | 3          | 40          |
-- | A           | 2          | 25          |
-- +-------------+------------+-------------+

/* =====================================================
   Q9: Points calculation (Sushi 2x)
   ===================================================== */
SELECT 
	customer_id,
    SUM(
		CASE
			WHEN product_name = 'Sushi' THEN price * 20 
            ELSE price * 10
		END
	) AS total_points
FROM Sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY customer_id;

-- Output:
-- +-------------+-------------+
-- | customer_id | total_points|
-- +-------------+-------------+
-- | A           | 860         |
-- | B           | 940         |
-- | C           | 360         |
-- +-------------+-------------+

/* =====================================================
   Q10: Points in first week after joining (2x all items)
   ===================================================== */
SELECT 
	s.customer_id,
    SUM(
		CASE 
			WHEN order_date BETWEEN join_date AND DATE_ADD(join_date, INTERVAL 6 DAY) THEN price * 20
            WHEN product_name = 'Sushi' THEN price * 20
            ELSE price * 10
		END
	) AS total_points
FROM sales s
JOIN members m ON s.customer_id = m.customer_id
JOIN menu mu ON s.product_id = mu.product_id
WHERE DATE_FORMAT(order_date, '%Y-%m-%d') <= '2021-01-31'
GROUP BY s.customer_id
ORDER BY s.customer_id;

-- Output:
-- +-------------+-------------+
-- | customer_id | total_points|
-- +-------------+-------------+
-- | A           | 1370        |
-- | B           | 820         |
-- +-------------+-------------+

/* =====================================================
   Bonus Q11: Membership flag table
   ===================================================== */
SELECT 
	s.customer_id,
    order_date,
    product_name,
    price,
    CASE 
		WHEN order_date >= join_date THEN 'Y'
        ELSE 'N'
	END AS member
FROM sales s
LEFT JOIN members m ON s.customer_id = m.customer_id
LEFT JOIN menu mu ON s.product_id = mu.product_id
ORDER BY s.customer_id;

-- Output:
-- +-------------+------------+-------------+-------+--------+
-- | customer_id | order_date | product_name| price | member |
-- +-------------+------------+-------------+-------+--------+
-- | A           | 2021-01-01 | sushi       | 10    | N      |
-- | A           | 2021-01-01 | curry       | 15    | N      |
-- | A           | 2021-01-07 | curry       | 15    | Y      |
-- | A           | 2021-01-10 | ramen       | 12    | Y      |
-- | A           | 2021-01-11 | ramen       | 12    | Y      |
-- | A           | 2021-01-11 | ramen       | 12    | Y      |
-- | B           | 2021-01-01 | curry       | 15    | N      |
-- | B           | 2021-01-02 | curry       | 15    | N      |
-- | B           | 2021-01-04 | sushi       | 10    | N      |
-- | B           | 2021-01-11 | sushi       | 10    | Y      |
-- | B           | 2021-01-16 | ramen       | 12    | Y      |
-- | B           | 2021-02-01 | ramen       | 12    | Y      |
-- | C           | 2021-01-01 | ramen       | 12    | N      |
-- | C           | 2021-01-01 | ramen       | 12    | N      |
-- | C           | 2021-01-07 | ramen       | 12    | N      |
-- +-------------+------------+-------------+-------+--------+

/* =====================================================
   Bonus Q12: Rank all member purchases
   ===================================================== */
WITH RankAllThings AS
(
	SELECT 
		s.customer_id,
		order_date,
		product_name,
		price,
		CASE 
			WHEN order_date >= join_date THEN 'Y'
				ELSE 'N'
		END AS member
	FROM sales s
	LEFT JOIN members m ON s.customer_id = m.customer_id
	LEFT JOIN menu mu ON s.product_id = mu.product_id
),
RankingAllItems AS
(
	SELECT *,
	CASE 
		WHEN member = 'Y' THEN DENSE_RANK() OVER(PARTITION BY customer_id, member ORDER BY order_date)
		ELSE NULL
	END AS ranking
	FROM RankAllThings
)
SELECT * FROM RankingAllItems;

-- Output:
-- +-------------+------------+-------------+-------+--------+---------+
-- | customer_id | order_date | product_name| price | member | ranking |
-- +-------------+------------+-------------+-------+--------+---------+
-- | A           | 2021-01-01 | sushi       | 10    | N      | NULL    |
-- | A           | 2021-01-01 | curry       | 15    | N      | NULL    |
-- | A           | 2021-01-07 | curry       | 15    | Y      | 1       |
-- | A           | 2021-01-10 | ramen       | 12    | Y      | 2       |
-- | A           | 2021-01-11 | ramen       | 12    | Y      | 3       |
-- | A           | 2021-01-11 | ramen       | 12    | Y      | 3       |
-- | B           | 2021-01-01 | curry       | 15    | N      | NULL    |
-- | B           | 2021-01-02 | curry       | 15    | N      | NULL    |
-- | B           | 2021-01-04 | sushi       | 10    | N      | NULL    |
-- | B           | 2021-01-11 | sushi       | 10    | Y      | 1       |
-- | B           | 2021-01-16 | ramen       | 12    | Y      | 2       |
-- | B           | 2021-02-01 | ramen       | 12    | Y      | 3       |
-- | C           | 2021-01-01 | ramen       | 12    | N      | NULL    |
-- | C           | 2021-01-01 | ramen       | 12    | N      | NULL    |
-- | C           | 2021-01-07 | ramen       | 12    | N      | NULL    |
-- +-------------+------------+-------------+-------+--------+---------+
