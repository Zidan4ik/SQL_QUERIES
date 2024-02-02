/*subquery.sql*/
SELECT *
FROM products
WHERE price > (SELECT AVG(price)
FROM products);

SELECT users.surname, (SELECT products.name
FROM products
WHERE shopping_cart.id_product=products.id) AS product, (SELECT products.price
FROM products
WHERE shopping_cart.id_product=products.id) AS price
FROM shopping_cart
JOIN users
ON shopping_cart.id_user=users.id;

SELECT surname AS id, SUM(price) AS price
FROM (SELECT shopping_cart.id_user AS id_user,products.price AS price
FROM shopping_cart
INNER JOIN products
ON shopping_cart.id_product=products.id
) AS s1
JOIN users
ON users.id = s1.id_user
GROUP BY id_user;

SELECT users.id,name,surname,age,job
FROM users
JOIN (SELECT user_details.id AS id,user_details.age AS age,user_details.job AS job
FROM user_details
WHERE age > 20) AS details
ON users.user_details_id=details.id;

SELECT user_details.age AS age, COUNT(*) AS count
FROM users
JOIN user_details
ON users.user_details_id=user_details.id
GROUP BY user_details.age
HAVING age IN (SELECT age
FROM user_details
WHERE age IN (19,20));


/* subequery INSERT */
INSERT INTO users(name,surname,city)
SELECT name,surname,city
FROM users
WHERE id=1;

/*subquery UPDATE */
UPDATE products
SET price = price - 100
WHERE products.price < (SELECT MAX(price)/1.5
FROM (SELECT price
FROM products)AS price);

/*subquery DELETE */
DELETE FROM user_details
WHERE user_details.id IN (SELECT s.id
FROM (SELECT user_details.id AS id
FROM user_details
WHERE age IN (21)
GROUP BY user_details.id
HAVING COUNT(age)<2)AS s);
