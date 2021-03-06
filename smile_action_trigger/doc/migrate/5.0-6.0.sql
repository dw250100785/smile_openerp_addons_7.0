﻿-- Migrate from 5.0 to 6.0
-- WARNING: Sartre Exceptions are not migrated (Use of smile_log in 6.0)
ALTER TABLE sartre_rule RENAME TO sartre_trigger;
ALTER SEQUENCE sartre_rule_id_seq RENAME TO sartre_trigger_id_seq;
ALTER TABLE sartre_trigger RENAME trigger_create TO on_create;
ALTER TABLE sartre_trigger RENAME trigger_write TO on_write;
ALTER TABLE sartre_trigger RENAME trigger_unlink TO on_unlink;
ALTER TABLE sartre_trigger RENAME trigger_login TO on_login;
ALTER TABLE sartre_trigger RENAME trigger_login_readonly TO on_login_readonly;
ALTER TABLE sartre_trigger RENAME trigger_function TO on_function;
ALTER TABLE sartre_trigger RENAME trigger_function_type TO on_function_type;
ALTER TABLE sartre_trigger RENAME trigger_function_field_id TO on_function_field_id;
ALTER TABLE sartre_trigger RENAME trigger_other TO on_other;
ALTER TABLE sartre_trigger RENAME trigger_other_method_id TO on_other_method_id;
ALTER TABLE sartre_trigger RENAME trigger_date TO on_date;
ALTER TABLE sartre_trigger RENAME trigger_date_type TO on_date_type;
ALTER TABLE sartre_trigger RENAME trigger_date_type_display1 TO on_date_type_display1;
ALTER TABLE sartre_trigger RENAME trigger_date_type_display2_id TO on_date_type_display2_id;
ALTER TABLE sartre_trigger RENAME trigger_date_range TO on_date_range;
ALTER TABLE sartre_trigger RENAME trigger_date_range_type TO on_date_range_type;
ALTER TABLE sartre_trigger RENAME trigger_date_range_operand TO on_date_range_operand;
ALTER TABLE sartre_condition RENAME TO sartre_filter;
ALTER SEQUENCE sartre_condition_id_seq RENAME TO sartre_filter_id_seq;
ALTER TABLE sartre_filter RENAME sartre_rule_id TO trigger_id;
ALTER TABLE sartre_execution RENAME rule_id TO trigger_id;
ALTER TABLE sartre_rule_server_action_rel RENAME TO sartre_trigger_server_action_rel;
ALTER TABLE sartre_trigger_server_action_rel RENAME sartre_rule_id TO trigger_id;
ALTER TABLE sartre_trigger_server_action_rel RENAME server_action_id TO action_id;
UPDATE ir_model_data SET model = 'sartre.trigger' WHERE model = 'sartre.rule';
UPDATE ir_model_data SET model = 'sartre.filter' WHERE model = 'sartre.condition';
UPDATE ir_model SET model = 'sartre.trigger' WHERE model = 'sartre.rule';
UPDATE ir_model SET model = 'sartre.filter' WHERE model = 'sartre.condition';
-- DROP TABLE sartre_exception;
