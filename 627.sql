-- 627. Swap Salary
update Salary
SET sex = case
        when sex = 'f' then 'm'
        else 'f'
    end