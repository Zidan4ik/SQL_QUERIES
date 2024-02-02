
SELECT t5.id,(t5.sum/t6.count_e) AS rating
FROM (SELECT t3.chain_id AS id,SUM(t3.sum1) AS sum
FROM (SELECT e.id AS id,e.name,e.chain_id AS chain_id, SUM(rate.rate)/COUNT(rate.rate) AS sum1
FROM establishment AS e
JOIN review 
ON e.id=review.establishment_id
JOIN rate
ON rate.review_id=review.id
GROUP BY e.id) AS t3
GROUP BY t3.chain_id
HAVING t3.chain_id IS NOT NULL
UNION
SELECT t4.id,t4.sum
FROM (SELECT e.id,e.chain_id AS chain_id, SUM(rate.rate)/COUNT(rate.rate) AS sum
FROM establishment AS e
JOIN review 
ON e.id=review.establishment_id
JOIN rate
ON rate.review_id=review.id
GROUP BY e.id
HAVING e.chain_id IS NULL) AS t4
ORDER BY id) AS t5
JOIN (SELECT t2.id, t2.count_e
FROM (SELECT e.id AS id, (SELECT COUNT(*)
FROM establishment AS e1
WHERE e1.chain_id=e.id) AS count_e
FROM establishment AS e) AS t2
WHERE t2.count_e!=0
UNION
SELECT e.id,COUNT(*)
FROM establishment AS e
WHERE (e.chain_id IS null AND e.is_chain=0)
GROUP BY e.id
ORDER BY id) AS t6
ON t5.id=t6.id;

SELECT t7.id,e7.name,ROUND(t7.rating, 2) AS rating
FROM (SELECT t5.id,(t5.sum/t6.count_e) AS rating
FROM (SELECT t3.chain_id AS id,SUM(t3.sum1) AS sum
FROM (SELECT e.id AS id,e.name,e.chain_id AS chain_id, SUM(rate.rate)/COUNT(rate.rate) AS sum1
FROM establishment AS e
JOIN review 
ON e.id=review.establishment_id
JOIN rate
ON rate.review_id=review.id
GROUP BY e.id) AS t3
GROUP BY t3.chain_id
HAVING t3.chain_id IS NOT NULL
UNION
SELECT t4.id,t4.sum
FROM (SELECT e.id,e.chain_id AS chain_id, SUM(rate.rate)/COUNT(rate.rate) AS sum
FROM establishment AS e
JOIN review 
ON e.id=review.establishment_id
JOIN rate
ON rate.review_id=review.id
GROUP BY e.id
HAVING e.chain_id IS NULL) AS t4
ORDER BY id) AS t5
JOIN (SELECT t2.id, t2.count_e
FROM (SELECT e.id AS id, (SELECT COUNT(*)
FROM establishment AS e1
WHERE e1.chain_id=e.id) AS count_e
FROM establishment AS e) AS t2
WHERE t2.count_e!=0
UNION
SELECT e.id,COUNT(*)
FROM establishment AS e
WHERE (e.chain_id IS null AND e.is_chain=0)
GROUP BY e.id
ORDER BY id	) AS t6
ON t5.id=t6.id) AS t7
JOIN establishment AS e7
ON t7.id=e7.id;