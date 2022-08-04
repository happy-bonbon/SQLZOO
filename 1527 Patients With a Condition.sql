-- 1527. Patients With a Condition
select patient_id,
    patient_name,
    conditions
from Patients
where conditions REGEXP '\\sDIAB1'
    or conditions REGEXP '^DIAB1';

-- Other versions
select *
from patients
where conditions REGEXP '\\bDIAB1';


-- Other versions
select *
from Patients
where conditions like '% DIAB1%'
    or conditions like 'DIAB1%';