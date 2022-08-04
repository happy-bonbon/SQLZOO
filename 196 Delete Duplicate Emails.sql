-- 196. Delete Duplicate Emails
delete b
from Person a
    inner join Person b
where a.email = b.email
    and a.id < b.id