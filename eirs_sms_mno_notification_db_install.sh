#!/bin/bash
. ~/.bash_profile
source ${commonConfigurationFile} 2>/dev/null

dbPassword=$(java -jar  ${pass_dypt} spring.datasource.password)

conn="mysql -h${dbIp} -P${dbPort} -u${dbUsername} -p${dbPassword} ${appdbName}"

`${conn} <<EOFMYSQL

INSERT IGNORE INTO operator (operator_name, channel_type) VALUES ('cellcard', 'kannel');
INSERT IGNORE INTO operator (operator_name, channel_type) VALUES ('metfone', 'kannel');
INSERT IGNORE INTO operator (operator_name, channel_type) VALUES ('seatel', 'kannel');
INSERT IGNORE INTO operator (operator_name, channel_type) VALUES ('smart', 'other');
INSERT IGNORE INTO operator (operator_name, channel_type) VALUES ('default', 'custom');

INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85510,85510,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85569,85569,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85570,85570,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85586,85586,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85593,85593,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85596,85596,'msisdn','smart',12);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85598,85598,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85515,85515,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85516,85516,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85581,85581,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85587,85587,'msisdn','smart',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85512,85512,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85589,85589,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85592,85592,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85517,85517,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85577,85577,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85595,85595,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85561,85561,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85514,85514,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85599,85599,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85578,85578,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85585,85585,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85511,85511,'msisdn','cellcard',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85560,85560,'msisdn','metfone',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85566,85566,'msisdn','metfone',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85590,85590,'msisdn','metfone',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85568,85568,'msisdn','metfone',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85531,85531,'msisdn','metfone',12);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85567,85567,'msisdn','metfone',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85571,85571,'msisdn','metfone',12);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85588,85588,'msisdn','metfone',12);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85597,85597,'msisdn','metfone',12);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85579,85579,'msisdn','metfone',11);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85518,85518,'msisdn','seatel',12);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45602,45602,'imsi','Smart',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45605,45605,'imsi','Smart',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45606,45606,'imsi','Smart',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45601,45601,'imsi','Cellcard',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45618,45618,'imsi','Cellcard',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45608,45608,'imsi','Metfone',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45609,45609,'imsi','Metfone',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45611,45611,'imsi','Seatel',15);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45612,45612,'imsi','cellcard',10);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45612,45612,'imsi','metfone',10);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45612,45612,'imsi','seatel',10);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (45612,45612,'imsi','smart',10);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85512,85512,'msisdn','cellcard',10);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85512,85512,'msisdn','metfone',10);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85512,85512,'msisdn','seatel',10);
INSERT IGNORE INTO operator_series(series_start,series_end,series_type,operator_name,length) values (85576,85576,'msisdn','cellcard',11);

INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('mediation_ftp_path','smart_file_path','/u01/cdr','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Smart Operator TPS Supported','smart_sms_tps','10','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('CellCard Operator TPS Supported','cellcard_sms_tps','15','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Metfone Operator TPS Supported','metfone_sms_tps','12','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Default Operator TPS Supported. It can be an aggregator or operator itself','default_sms_tps','10','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('default SMS Notification sent url http url','default_sms_url','N/A','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Smart SMS Notification sent url','smart_sms_url','https://mife.smart.com.kh:8243/smsmessaging/v1/outbound/tel%3A%2B310/requests','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Smart SMS Notification sent url http url','cellcard_sms_url','http://10.100.1.4:15013/cgi-bin/sendsms','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Metfone SMS Notification sent url http url','metfone_sms_url','http://10.100.1.134:15013/cgi-bin/sendsms','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Smart authentication credentials Username','smart_username','N/A','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Smart authentication credentials Password','smart_password','N/A','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Cellcard authentication credentials Username','cellcard_username','123','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Cellcard authentication credentials Password','cellcard_password','123','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Metfone authentication credentials Username','metfone_username','123','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Metfone authentication credentials Password','metfone_password','123','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Seatel authentication credentials Username','seatel_username','123','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Seatel authentication credentials Password','seatel_password','123','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('SMS Sender ID for smart','smart_sender_id','IMEI KH','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('SMS Sender ID for Cellcard','cellcard_sender_id','IMEI KH','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('SMS Sender ID for Metfone','metfone_sender_id','IMEI KH','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('SMS Sender ID for seatel','seatel_sender_id','IMEI KH','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('SMS Sender ID for Deafult','default_sender_id','IMEI KH','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Token received from smart on authorization','smart_token','0dbbca53-b7f2-3fbc-a03a-bbe18660a785','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Token expiry duration in seconds','smart_token_timeout_in_sec','3600','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Smart token url to get Auth token url','smart_token_url','https://mife.smart.com.kh:8243/token','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Smart consumer key used for Auth Token','smart_consumer_key','e3A07qYUfzv64934dqMHeMZg5yIa','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','smart_consumer_secret','oZ0DWsPp2nbH5Sv159Y9f15fEeoa','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','smart_callback_url','https://lab-smart.eirs.gov.kh/eirs/callback/smart','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','seatel_sms_url','http://10.100.1.134:15013/cgi-bin/sendsms','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','seatel_sms_tps','12','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','seatel_callback_url','http://10.100.1.134:9515/eirs/callback/kanel','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','seatel_smsc_code','SMSC01','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','cellcard_smsc_code','SMSC02','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','metfone_callback_url','http://10.100.1.134:9515/eirs/callback/kanel','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('','cellcard_callback_url','http://10.100.1.1344:9515/eirs/callback/kanel','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('Number of attempts to send SMS','sms_retry_count','3','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('SMS retry time difference','sms_retry_interval','15000','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (description,tag,value,feature_name,user_type,modified_by) VALUES ('SMS Kannel DLR Mask','kanelDlrMask','31','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (DESCRIPTION,tag,VALUE,feature_name,user_type,modified_by) VALUES ('SMS METFONE SMSC','metfone_smsc_code','SMSC03','SMS Notification','system','system');

INSERT IGNORE INTO cfg_feature_alert (alert_id, description, feature) VALUES ('alert1207', '<e> not found in configured MNOs msisdn series and marked as Default operator. Corrective action to update new msisdn series to be taken', 'SMS Notification');
INSERT IGNORE INTO cfg_feature_alert (alert_id, description, feature) VALUES ('alert1203', 'Operator <e> is down', 'SMS Notification');

EOFMYSQL`



echo "tables creation completed."




echo "                                             *
                                                  ***
                                                 *****
                                                  ***
                                                   *                           "
echo "********************Thank You DB Process is completed now *****************"
