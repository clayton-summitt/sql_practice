--Your are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that returns the top 10 customers by total amount spent ordered from highest to lowest. Total number of payments has also been requested.

--The query should output the following columns:

--customer_id [int4]
--email [varchar]
--payments_count [int]
--total_amount [float]
--and has the following requirements:

--only returns the 10 top customers, ordered by total amount spent from highest to lowest



select 
    customer.customer_id , 
    customer.email as email,
    count(payment.amount) as payments_count,
    cast (sum(payment.amount) as FLOAT) as total_amount
FROM
     customer 
left join 
payment  on customer.customer_id = payment.customer_id
group by 
    customer.customer_id, email
order by 
    total_amount desc
limit 10;


-- For this challenge you need to create a simple GROUP BY statement, 
-- you want to group all the people by their age and count the people who have the same age.

-- people table schema
-- id
-- name
-- age

SELECT 
    age, 
    count(id) as people_count
FROM 
    people
group by 
    age



-- Oh no! Timmys been moved into the database divison of his software company but as we know Timmy loves making mistakes. Help Timmy keep his job by fixing his query...

-- Timmy works for a statistical analysis company and has been given a task of totaling the number of sales on a given day grouped by each department name and then each day.

-- Resultant table:
-- day (type: date) {group by} [order by asc]
-- department (type: text) {group by} [In a real world situation it is bad practice to name a column after a table]
-- sale_count (type: int)

SELECT 
  cast (s.transaction_date  as DATE) as day,
  d.name as department ,
  COUNT(s.id) as sale_count
FROM 
    department d
JOIN 
    sale s on d.id = s.department_id
group by 
    department, 
    day
order by 
    day, 
    department
  