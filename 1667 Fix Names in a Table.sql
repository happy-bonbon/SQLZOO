-- 1667. Fix Names in a Table
select user_id,
    REGEXP_REPLACE(LOWER(name), '^[a-z]', UPPER(SUBSTRING(name, 1, 1))) as name
from Users
order by user_id