--List all customers along with their total payment amount.
--Output: customer_id, full_name, total_amount

select cust.customer_id, cust.first_name, cust.last_name, sum(pay.amount) as total_amount
from customer as cust
inner join payment as pay
on cust.customer_id = pay.customer_id
group by cust.customer_id, cust.first_name, cust.last_name;


--Q2: Retrieve the top 10 customers by total amount spent.
--Output: full_name, email, total_amount

select cust.customer_id, cust.first_name, cust.last_name, cust.email, sum(pay.amount) as total_amount
from customer as cust
inner join payment as pay
on cust.customer_id = pay.customer_id
group by cust.customer_id, cust.first_name, cust.last_name
order by total_amount desc
limit (10);

--Display all films and their corresponding categories.
--Tables: film, film_category, category

select f.film_id, f.title, fc.category_id, c.name
from film as f
join film_category as fc
on f.film_id = fc.film_id
join category as c
on c.category_id = fc.category_id;

--Find the number of rentals made by each customer.
--Output: customer_id, full_name, total_rentals
select c.customer_id, c.first_name, c.last_name, count(r.customer_id) as total_rentals
from customer as c
join rental as r
on c.customer_id = r.customer_id
group by c.customer_id;

--List customers who have never made a payment.
select c.customer_id, c.first_name, c.last_name, p.amount, p.payment_id
from customer as c
left join payment as p 
on c.customer_id = p.customer_id
where p.payment_id is null;

--Show total revenue generated per store.
--Tables: store, staff, payment

select p.staff_id, sum(p.amount), st.store_id
from payment as p
join staff as s
on s.staff_id = p.staff_id
join store as st
on st.store_id = s.store_id
group by st.store_id, p.staff_id;

-- the top 5 most rented movies.
--Output: film_title, rental_count

select f.title, count(r.rental_id) as most_rented
from film as f
join inventory as i
on f.film_id = i.film_id 
join rental as r
on i.inventory_id = r.rental_id
group by f.title
order by most_rented desc
limit(5);

--Find customers who rented more than 30 films.
--Output: full_name, rental_count

select c.first_name, c.last_name, count(r.rental_id) as rental_count
from customer as c
join rental as r
on c.customer_id = r.customer_id
group by c.customer_id
having count(r.rental_id) > '30'
order by rental_count desc;
