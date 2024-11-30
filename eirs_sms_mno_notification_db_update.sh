#!/bin/bash
. ~/.bash_profile
source ${commonConfigurationFile} 2>/dev/null

dbPassword=$(java -jar  ${pass_dypt} spring.datasource.password)

conn="mysql -h${dbIp} -P${dbPort} -u${dbUsername} -p${dbPassword} ${appdbName}"

`${conn} <<EOFMYSQL

UPDATE sys_param SET description = 'Smart Consumer secret key used for Auth Token' WHERE tag = 'smart_consumer_secret';
UPDATE sys_param SET description = 'Callback URL for Smart server' WHERE tag = 'smart_callback_url';
UPDATE sys_param SET description = 'SMS URL for Seatel server' WHERE tag = 'seatel_sms_url';
UPDATE sys_param SET description = 'SMS TPS for Seatel server' WHERE tag = 'seatel_sms_tps';
UPDATE sys_param SET description = 'Callback URL for Seatel server' WHERE tag = 'seatel_callback_url';
UPDATE sys_param SET description = 'SMSC code for Seatel server' WHERE tag = 'seatel_smsc_code';
UPDATE sys_param SET description = 'SMSC code for Cellcard server' WHERE tag = 'cellcard_smsc_code';
UPDATE sys_param SET description = 'Callback URL for Metfone server' WHERE tag = 'metfone_callback_url';
UPDATE sys_param SET description = 'Callback URL for Cellcard server' WHERE tag = 'cellcard_callback_url';

UPDATE cfg_feature_alert SET description = '<e> not found in configured MNOs msisdn series and marked as Default operator. Corrective action to update new msisdn series to be taken', feature = 'SMS Notification' WHERE alert_id = 'alert1207';
UPDATE cfg_feature_alert SET feature = 'SMS Notification' WHERE alert_id = 'alert1203';

DELETE FROM sys_param WHERE tag = 'agg_report_last_run_time';
DELETE FROM sys_param WHERE tag = 'smart_file_path';
DELETE FROM sys_param WHERE tag = 'smart_username';
DELETE FROM sys_param WHERE tag = 'smart_password';


EOFMYSQL`



echo "tables creation completed."




echo "                                             *
                                                  ***
                                                 *****
                                                  ***
                                                   *                           "
echo "********************Thank You DB Process is completed now *****************"
