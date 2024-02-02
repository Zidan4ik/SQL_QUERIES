/*Aggregate function*/
SELECT city,COUNT(*)
FROM users
GROUP BY city;

SELECT MIN(price)
FROM products;

SELECT MAX(age)
FROM user_details;

SELECT users.surname AS surname, users.name AS name, user_details.age AS age
FROM user_details
JOIN users
ON users.user_details_id=user_details.id
WHERE user_details.age = (SELECT MAX(age)
FROM user_details);

SELECT orders.user_id,SUM(orders.summa)
FROM orders
GROUP BY orders.user_id;

SELECT users.surname,SUM(orders.summa),CONCAT(GROUP_CONCAT(orders.list separator ', '))
FROM orders
JOIN users
ON orders.user_id=users.id
GROUP BY users.id;

SELECT city,COUNT(*) AS min_count
FROM users
GROUP BY city
HAVING COUNT(*) = (SELECT MIN(min_count)
FROM (SELECT COUNT(*) AS min_count
FROM users
GROUP BY city) AS city_counts);

SELECT users.id,users.surname,AVG(summa)
FROM orders
JOIN users
ON users.id=orders.user_id
GROUP BY orders.user_id;