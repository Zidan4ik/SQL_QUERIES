/* tasks */

-- 3.1
/* Вивести усі записи з таблиці Users. */

SELECT * 
FROM users;

-- 3.2
/* Вивести список користувачів, у яких username містить літеру "A". */

SELECT *
FROM users
WHERE name LIKE '%A%';

-- 3.3
/* Вивести інформацію про продукти з ціною понад 100. */

SELECT *
FROM products
WHERE price > 100;

-- 3.4
/* Вивести користувачів, які не мають додаткових даних (User_Details). */

SELECT *
FROM users
WHERE users.user_details_id IS NULL;

-- 3.5
/* Вивести список продуктів та кількість користувачів, які додали їх до кошика. */

SELECT p.id,p.name, COUNT(sc.id)
FROM shopping_cart AS sc
JOIN products as p
ON sc.id_product=p.id
GROUP BY sc.id_product;

-- 3.6
/* Знайдіть загальну суму замовлень кожного користувача. */

SELECT u.id,u.surname,SUM(o.summa) AS summa
FROM orders AS o
JOIN users AS u
ON o.user_id=u.id
GROUP BY o.user_id
ORDER BY u.id;

-- 3.7
/* Вивести список продуктів, що є у кошику користувача (за id). */

SELECT sc.id_user,p.*
FROM shopping_cart AS sc
JOIN products AS p
ON sc.id_product=p.id
WHERE sc.id_user = 1;


-- 3.8
/* Вивести список користувачів, які мають замовлення на суму понад 500. */

SELECT u.surname,o.summa AS price
FROM orders AS o
JOIN users AS u
ON o.user_id=u.id
WHERE o.summa > 500;


-- 3.9
/* Вивести користувача, який купив найбільше товарів. */

SELECT u.surname,COUNT(*) AS amount
FROM shopping_cart AS sc
JOIN users AS u
ON sc.id_user=u.id
GROUP BY u.surname
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 3.10
/* Вивести список 10 найдорожчих товарів. */

SELECT *
FROM (SELECT *
FROM products
ORDER BY products.price DESC
LIMIT 10) AS p
order by p.id;

-- 3.11
/* Вивести список товарів з ціною вищою за середню. */

SELECT *
FROM products
WHERE price > (SELECT AVG(price)
FROM products);

-- 3.12
/* Вивести список користувачів, у яких сумарна вартість продуктів у кошику перевищує середню вартість 
продуктів у кошику всіх користувачів. */

SELECT sc.id_user,u.surname,SUM(price) AS price
FROM shopping_cart AS sc
JOIN users AS u
ON sc.id_user=u.id
JOIN products AS p
ON sc.id_product=p.id
GROUP BY sc.id_user
HAVING SUM(price) > (SELECT AVG(price)
FROM (SELECT sc.id_user,SUM(p.price) AS price
FROM shopping_cart AS sc
JOIN users AS u
ON sc.id_user=u.id
JOIN products AS p
ON sc.id_product=p.id
GROUP BY sc.id_user) AS total_summa_users);

-- 3.13
/* Вивести користувачів, у яких усі продукти в кошику мають ціну вище 100. */

SELECT u.*
FROM shopping_cart AS sc
JOIN users AS u
ON sc.id_user=u.id
JOIN products AS p
ON sc.id_product=p.id
WHERE p.price IN (SELECT p.price
FROM products AS p
WHERE p.price>100)
GROUP BY sc.id_user
ORDER BY u.id ASC;


-- 3.14
/* Вивести список продуктів, які є у кошику у всіх користувачів. */

SELECT p.*,COUNT(sc1.id_user)AS total_people
FROM products AS p
INNER JOIN shopping_cart AS sc1
ON p.id=sc1.id_product
GROUP BY p.id
HAVING COUNT(sc1.id_user) = (SELECT COUNT(DISTINCT sc2.id_user) FROM shopping_cart AS sc2);

-- 3.15
/* Вивести інформацію про користувачів, у яких у кошику 
присутні продукти із загальною кількістю понад 10 одиниць. */

SELECT u.*, COUNT(sc.id_user) AS amount
FROM users AS u 
JOIN shopping_cart AS sc
ON u.id=sc.id_user
GROUP BY sc.id_user
HAVING COUNT(sc.id_user)>10;

-- 3.16
/* Вивести користувача, у якого сума всіх замовлень перевищує суму замовлень іншого користувача. */

SELECT u.*, SUM(o.summa) as summa
FROM orders AS o
JOIN users AS u
ON u.id=o.user_id
GROUP BY u.id
HAVING  summa > ALL (SELECT SUM(o2.summa)
FROM orders AS o2
WHERE o2.user_id!=u.id
GROUP BY o2.user_id);

-- 3.17
/* Вивести список користувачів, у яких кількість продуктів у кошику перевищує середню кількість 
продуктів у кошику всіх користувачів. */

SELECT u.*,COUNT(sc.id_product) AS amount_products
FROM users AS u
JOIN shopping_cart AS sc
ON u.id=sc.id_user
GROUP BY sc.id_user
HAVING COUNT(sc.id_product) > (SELECT (SELECT COUNT(sc2.id_product) 
FROM shopping_cart AS sc2)/(SELECT COUNT(DISTINCT sc3.id_user)
FROM shopping_cart AS sc3 ) AS avg_products);

-- 3.18
/* Вивести продукти, які є в кошику лише одного користувача. */

SELECT p.*
FROM products AS p
JOIN shopping_cart AS sc1
ON p.id=sc1.id_product
GROUP BY p.id
HAVING COUNT( DISTINCT sc1.id_user) = 1;

-- 3.19
/* Вивести користувачів, у яких сумарна вартість замовлень перевищує 1000, та кількість замовлень понад 3.*/

SELECT u.*,SUM(o.summa) AS summa,COUNT(o.id) AS amount
FROM users AS u
JOIN orders AS o
ON u.id=o.user_id
GROUP BY o.user_id
HAVING SUM(o.summa)>=1000 AND COUNT(o.id)>=3;

-- 3.20
/* Вивести інформацію про продукт із найбільшою сумарною вартістю у кошиках користувачів. */

SELECT p.*
FROM products AS p
JOIN shopping_cart AS sc
ON p.id=sc.id_product
GROUP BY p.id,sc.id_user
HAVING SUM(p.price) = (SELECT MAX(prices)
FROM (SELECT sc.id_user,p.id,SUM(p.price) AS prices
FROM products AS p
JOIN shopping_cart AS sc
ON p.id=sc.id_product
GROUP BY p.id,sc.id_user) AS all_price
);

