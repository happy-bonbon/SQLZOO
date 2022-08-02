-- 627. Swap Salary
update Salary
SET sex = case
        when sex = 'f' then 'm'
        else 'f'
    end;
-- better version
update Salary
SET sex = if(sex = 'm', 'f', 'm');