--
-- define ORDS module workshop
--
--  DEFINE MODULE
BEGIN
    ORDS.DEFINE_MODULE(
        p_module_name => 'workshop',
        p_base_path => '/wsapi/',
        p_items_per_page=> 25,
        p_status => 'PUBLISHED',
        p_comments=> ''
    );
    COMMIT;
END;
--
--  DEFINE TEMPLATE tempkmh, API for update both temp and kmh
--
BEGIN
    ORDS.DEFINE_TEMPLATE(
        p_module_name => 'workshop',
        p_pattern => 'tempkmh',
        p_priority => 0,
        p_etag_type => 'HASH',
        p_comments => ''
    );
    COMMIT;
END;
--
-- define POST handler for payload of
-- type {"kmh":333,"temp":3.5}
--
BEGIN
    ORDS.DEFINE_HANDLER(
        p_module_name => 'workshop',
        p_pattern => 'tempkmh',
        p_method => 'POST',
        p_source_type => ords.source_type_plsql,
        p_source => 'begin insert into logdata (temp,kmh) values(:temp,:kmh); commit; end;',
        p_items_per_page => 25,
        p_comments => '',
        p_mimes_allowed => 'application/json'
    );
    COMMIT;
END;

--
--  DEFINE TEMPLATE kmh, API for update  kmh only
--
BEGIN
    ORDS.DEFINE_TEMPLATE(
        p_module_name => 'workshop',
        p_pattern => 'kmh',
        p_priority => 0,
        p_etag_type => 'HASH',
        p_comments => ''
    );
    COMMIT;
END;
--
-- define POST handler for payload of
-- type {"kmh":333}
--
BEGIN
    ORDS.DEFINE_HANDLER(
        p_module_name => 'workshop',
        p_pattern => 'kmh',
        p_method => 'POST',
        p_source_type => ords.source_type_plsql,
        p_source => 'begin insert into current_speed (kmh) values(:kmh); commit; end;',
        p_items_per_page => 25,
        p_comments => '',
        p_mimes_allowed => 'application/json'
    );
    COMMIT;
END;

--
--  DEFINE TEMPLATE temp, API for update  temp only
--
BEGIN
    ORDS.DEFINE_TEMPLATE(
        p_module_name => 'workshop',
        p_pattern => 'temp',
        p_priority => 0,
        p_etag_type => 'HASH',
        p_comments => ''
    );
    COMMIT;
END;
--
-- define POST handler for payload of
-- type {"temp":3.5}
--
BEGIN
    ORDS.DEFINE_HANDLER(
        p_module_name => 'workshop',
        p_pattern => 'temp',
        p_method => 'POST',
        p_source_type => ords.source_type_plsql,
        p_source => 'begin insert into logdata (temp) values(:temp); commit; end;',
        p_items_per_page => 25,
        p_comments => ''
    );
    COMMIT;
END;











