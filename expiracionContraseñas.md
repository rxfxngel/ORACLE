//For seeing Full user details
SELECT profile FROM dba_users WHERE username = 'SYSTEM';

//This query is used to change the password life time to unlimited
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED; 

//This query is used to chagne the default password.
alter user SYSTEM identified by "system";
