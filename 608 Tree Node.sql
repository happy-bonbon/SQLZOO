-- 608. Tree Node
SELECT id,
       CASE WHEN id is null or id IN (
               SELECT distinct b.p_id
                 FROM Tree a
                      JOIN
                      tree b ON a.p_id = b.id
           )
       THEN 'Root' WHEN id IN (
               SELECT a.p_id
                 FROM Tree a
                      JOIN
                      tree b ON a.p_id = b.id
           )
       THEN 'Inner' ELSE 'Leaf' END AS type
  FROM tree;


--     (select a.id FROM Tree a JOIN tree b ON a.p_id = b.id)
-- (select a.p_id FROM Tree a JOIN tree b ON a.p_id = b.id)
-- (select b.p_id FROM Tree a JOIN tree b ON a.p_id = b.id)
distinct