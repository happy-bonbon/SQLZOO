-- 1965. Employees With Missing Information
select e.employee_id
from Employees e
    left join Salaries s on e.employee_id = s.employee_id
where e.employee_id is null
    or s.employee_id is null
UNION
select s.employee_id
from Salaries s
    left join Employees e on s.employee_id = e.employee_id
where e.employee_id is null
    or s.employee_id is null
order by employee_id asc;
-- better version
select employee_id
from Employees
where employee_id not in (
        select employee_id
        from Salaries
    )
union
select employee_id
from Salaries
where employee_id not in (
        select employee_id
        from Employees
    )
order by employee_id;