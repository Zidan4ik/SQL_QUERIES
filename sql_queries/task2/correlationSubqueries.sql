/* correlation subqueries */
SELECT u.id, u.surname, (SELECT user_details.age
FROM user_details
WHERE user_details.id=u.user_details_id) AS age
FROM users AS u;

SELECT sc.id_user AS id, (SELECT surname
FROM users
WHERE users.id=sc.id_user) AS surname,
(SELECT user_details.age
FROM user_details
WHERE user_details.id = (SELECT users.user_details_id
FROM users
WHERE users.id = sc.id_user)) AS age
FROM shopping_cart AS sc
GROUP BY sc.id_user;


SELECT u.id,u.surname, orders.list,orders.summa
FROM users AS u
JOIN orders
ON u.id=orders.user_id
WHERE u.id IN (SELECT orders.user_id
FROM orders
WHERE orders.user_id=u.id AND orders.summa > 200);