
create or replace trigger "LOGDATA_T"

before insert on "LOGDATA"

REFERENCING NEW AS New OLD AS Old
for each row
  l_application_id integer:=100;   -- The application ID needs to be changed after the import of the APEX app
begin

    for l_subscription in ( 
        select distinct user_name
        from apex_appl_push_subscriptions
        where application_id = l_application_id 
    )
    loop
        begin

            apex_pwa.send_push_notification (
                p_application_id => l_application_id,
                p_user_name      => l_subscription.user_name,
                p_title          => 'Ny måling',
                p_body           => to_char(:new.logtime, 'hh24:mi') || ' - ' || :new.temp || '°C / ' || :new.kmh || ' => ' || predict_consumption(:new.kmh, :new.temp)
            );
        exception
            when others then
                null;
        end;
    end loop;
end;
/