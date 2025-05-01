/* Вопрос 1: Вывести 5 самых популярных товаров */

select goods.good_name good, count(good_name) as quantity
from goods
  join orders on goods.good_id = orders.good_id
group by good_name
order by count(good_name) desc
limit 5;

/* Вопрос 2: Накопленная сумма заказов каждого клиента */

select  order_id, c.first_name, c.last_name, g.good_name, o.total_sum as purchase,
  sum(o.total_sum) over (partition by first_name, last_name order by order_id)
from orders o
  left join customers c on c.customer_id = o.customer_id
  left join goods g on g.good_id = o.good_id;

/* Вопрос 3: Средний чек каждого клиента */

select c.first_name, c.last_name, round(avg(total_sum), 2) as average_bill
from orders o
  join customers c on c.customer_id = o.customer_id
group by first_name, last_name;

/* Вопрос 4: Список клиентов, которые совершили более одной покупки */

select c.last_name, c.first_name
from customers c
  right join orders o on c.customer_id = o.customer_id
group by first_name, last_name
having count(*) > 1;

/* Вопрос 5: Вывести 3 самых прибыльных категории товаров и их прибыль */

select category, sum(total_sum) as total
from goods g
  join orders o on o.good_id = g.good_id
group by category
order by total desc
limit 3;

