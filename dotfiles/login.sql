-- set linesize 
set linesize 120

-- enable server output ( necessary for desc.sql functionality )
set serveroutput on
set serveroutput on size 100000

-- define editor (this ensure that I can vim running as vim and not as 'vi' )
define _editor = "/usr/bin/vim"

-- set sqlprompt to _user@_connect_identifier
-- We can't use: SET SQLPROMPT "_USER'@'_CONNECT_IDENTIFIER> "
-- because gqlplus has issues with the above statement. Plus, setting the sqlprompt this way 
-- is better any way because it means that both user and _connect_identifier are lower case.
undefine usr db
col usr new_value usr
col db  new_value db

set termout off
select lower(user) usr, lower( substr(global_name, 1, instr(global_name, '.')-1) ) db
from   global_name
/
set termout on

set sqlprompt '&&usr.@&&db.> '
