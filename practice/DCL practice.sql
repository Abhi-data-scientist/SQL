use regex;
-- Q1. Give SELECT permission on students table to user1
revoke all on employees from 'regex';
grant select on employees to 'regex';

-- Give SELECT and UPDATE permission to user2
grant select, update on employees to 'regex';
revoke select, update on employees from 'regex';

-- give all permission 
grant all on employees to 'regex';

-- Create a role called teacher_role
create role teacher_role;
drop role teacher_role;
-- Give SELECT and INSERT permission to teacher_role
grant select, insert on employees to teacher_role;

-- Assign role to teacher1
grant teacher_role to regex;

-- Remove role from teacher1
revoke teacher_role from regex;

-- Drop role
drop role teacher_role;