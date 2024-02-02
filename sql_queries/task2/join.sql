/*LEFT OUTER*/
SELECT *
FROM users
LEFT OUTER JOIN user_details
ON users.user_details_id = user_details.id;

/*LEFT*/
SELECT *
FROM users
LEFT JOIN user_details
ON users.user_details_id = user_details.id;

/*RIGHT OUTER*/
SELECT *
FROM users
RIGHT OUTER JOIN user_details
ON users.user_details_id = user_details.id;

/*RIGHT*/
SELECT *
FROM users
RIGHT JOIN user_details
ON users.user_details_id = user_details.id;

/*INNER JOIN*/
SELECT *
FROM users
INNER JOIN user_details
ON users.user_details_id = user_details.id;

/*FULL JOIN*/
SELECT *
FROM users
LEFT JOIN user_details
ON users.user_details_id = user_details.id
UNION
SELECT *
FROM users
RIGHT JOIN user_details
ON users.user_details_id = user_details.id;

/*JOIN with three tables*/
SELECT *
FROM users
RIGHT OUTER JOIN shopping_cart
ON users.id = shopping_cart.id_user
LEFT JOIN products
ON products.id = shopping_cart.id_product;