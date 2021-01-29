--Your are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that returns the top 10 customers by total amount spent ordered from highest to lowest. Total number of payments has also been requested.

--The query should output the following columns:

--customer_id [int4]
--email [varchar]
--payments_count [int]
--total_amount [float]
--and has the following requirements:

--only returns the 10 top customers, ordered by total amount spent from highest to lowest



select customer.customer_id , 
  customer.email as email,
  count(payment.amount) as payments_count,
  cast (sum(payment.amount) as FLOAT) as total_amount
FROM customer 
left join 
payment  on customer.customer_id = payment.customer_id
group by customer.customer_id, email
order by total_amount desc
limit 10;


-- For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age [group by]
-- people_count (people count)

