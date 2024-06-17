--
-- Version V2
--
declare
   base_username varchar2(100):='enter_user_name_prefix_here';
   username varchar2(100);
   drop_stmt varchar2(100);
   antall integer:=30;
   l_workspace_id integer;
begin
  for i in 1..antall loop
    begin
        username:=base_username||trim(to_char(i,'09'));
        l_workspace_id := apex_util.find_security_group_id (p_workspace => username);
        apex_util.set_security_group_id (p_security_group_id => l_workspace_id); 
        APEX_UTIL.REMOVE_USER(p_user_name => username);
        APEX_INSTANCE_ADMIN.REMOVE_WORKSPACE( username,'Y','N');  -- Drops schema 'Y'
        -drop_stmt:='drop user '||username||' cascade';  
        execute immediate drop_stmt;
    exception
        when others then
        dbms_output.put_line('Sqlerror: ');
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
    end;
  end loop;
end;
/