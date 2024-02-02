create or replace function predict_consumption(kmh integer,temp in integer) return integer is
begin
  return(kmh+temp);
end;
/
--  DEFINE MODULE
BEGIN
    ORDS.DEFINE_MODULE(
        p_module_name => 'ml',
        p_base_path => '/ml/',
        p_items_per_page=> 25,
        p_status => 'PUBLISHED',
        p_comments=> ''
    );
    COMMIT;
END;
/
--  DEFINE TEMPLATE
BEGIN
    ORDS.DEFINE_TEMPLATE(
        p_module_name => 'ml',
        p_pattern => 'predict/',
        p_priority => 0,
        p_etag_type => 'HASH',
        p_comments => ''
    );
    COMMIT;
END;
/
-- DEFINE HANDLER
BEGIN
    ORDS.DEFINE_HANDLER(
        p_module_name => 'ml',
        p_pattern => 'predict/',
        p_method => 'GET',
        p_source_type => ords.source_type_plsql,
        p_source => 'begin :p_result:=predict_consumption(:p_kmh,:p_temp); end;',
        p_items_per_page => 0,
        p_comments => ''
    );
    COMMIT;
END;
/
-- DEFINE PARAMETER
BEGIN
    ORDS.DEFINE_PARAMETER(
        p_module_name => 'ml',
        p_pattern => 'predict/',
        p_method => 'GET',
        p_name => 'kmh',
        p_bind_variable_name => 'p_kmh',
        p_source_type => 'URI',
        p_access_method => 'IN',
        p_comments => '',
        p_param_type => 'STRING'
    );
    COMMIT; 
END;
/
-- DEFINE PARAMETER
BEGIN
    ORDS.DEFINE_PARAMETER(
        p_module_name => 'ml',
        p_pattern => 'predict/',
        p_method => 'GET',
        p_name => 'temp',
        p_bind_variable_name => 'p_temp',
        p_source_type => 'URI',
        p_access_method => 'IN',
        p_comments => '',
        p_param_type => 'STRING'
    );
    COMMIT; 
END;
/

-- DEFINE PARAMETER
BEGIN
    ORDS.DEFINE_PARAMETER(
        p_module_name => 'ml',
        p_pattern => 'predict/',
        p_method => 'GET',
        p_name => 'result',
        p_bind_variable_name => 'p_result',
        p_source_type => 'RESPONSE',
        p_access_method => 'OUT',
        p_comments => '',
        p_param_type => 'STRING'
    );
    COMMIT; 
END;
/


