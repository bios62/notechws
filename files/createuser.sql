declare
   base_username varchar2(100):='enter_user_name_prefix_here';
   username varchar2(100);
   stmt varchar2(100);
   antall integer :=30;
   i integer;
   password varchar2(100):='enter_password_here';

begin
    for i in 1..antall loop
        begin
            username:=base_username||trim(to_char(i,'09'));
            -- USER SQL
            stmt:='CREATE USER '||username||' IDENTIFIED BY '||password;
            execute immediate stmt;
            -- ADD ROLES
            stmt:='GRANT CONNECT,CONSOLE_DEVELOPER,DWROLE,OML_DEVELOPER,RESOURCE TO '||username;
            execute immediate stmt;
            stmt:='ALTER USER '||username||' DEFAULT ROLE CONSOLE_DEVELOPER,DWROLE,OML_DEVELOPER';
            execute immediate stmt;
            -- QUOTA
            stmt:='ALTER USER '||username||' QUOTA 500M ON DATA';
            execute immediate stmt;
            -- REST ENABLE
            ORDS_ADMIN.ENABLE_SCHEMA(
                p_enabled => TRUE,
                p_schema => username,
                p_url_mapping_type => 'BASE_PATH',
                p_url_mapping_pattern => username,
                p_auto_rest_auth=> TRUE
            );
            -- ENABLE DATA SHARING
            C##ADP$SERVICE.DBMS_SHARE.ENABLE_SCHEMA(
                    SCHEMA_NAME => username,
                    ENABLED => TRUE
            );
            commit;
        exception
            when others then
            dbms_output.put_line('Sqlerror: ');
                dbms_output.put_line(sqlcode);
                dbms_output.put_line(sqlerrm);
    end;
    end loop;
end;
/

