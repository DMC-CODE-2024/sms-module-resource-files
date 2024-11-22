#!/bin/bash
conffile=/u01/eirsapp/configuration/configuration.properties
typeset -A config # init array

while read line
do
    if echo $line | grep -F = &>/dev/null
    then
        varname=$(echo "$line" | cut -d '=' -f 1)
        config[$varname]=$(echo "$line" | cut -d '=' -f 2-)
    fi
done < $conffile
conn1="mysql -h${config[dbIp]} -P${config[dbPort]} -u${config[dbUsername]} -p${config[dbPassword]}"
conn="mysql -h${config[dbIp]} -P${config[dbPort]} -u${config[dbUsername]} -p${config[dbPassword]} ${config[appdbName]}"

echo "creating app database."
${conn1} -e "CREATE DATABASE IF NOT EXISTS app;"
echo " app database successfully created!"

`${conn} <<EOFMYSQL

ALTER TABLE notification ADD COLUMN sms_scheduled_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE operator (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    operator_name VARCHAR(255),
    channel_type VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE operator_properties (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_on DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    operator_id BIGINT,
    key VARCHAR(255),
    value VARCHAR(255),
    FOREIGN KEY (operator_id) REFERENCES operator(id)
);

INSERT INTO operator (operator_name, channel_type) VALUES ('smart', 'custom');
INSERT INTO operator (operator_name, channel_type) VALUES ('cellcard', 'custom');
INSERT INTO operator (operator_name, channel_type) VALUES ('metfone', 'custom');
INSERT INTO operator (operator_name, channel_type) VALUES ('seatel', 'custom');
INSERT INTO operator (operator_name, channel_type) VALUES ('default', 'custom');

INSERT INTO cfg_feature_alert (alert_id, description, feature) VALUES ('alert1207', '<ERROR> not found in configured MNOs msisdn series and marked as Default operator. Corrective action to update new msisdn series to be taken', 'sms-service');

EOFMYSQL`



echo "tables creation completed."




echo "                                             *
                                                  ***
                                                 *****
                                                  ***
                                                   *                           "
echo "********************Thank You DB Process is completed now for EIR LSM  Module*****************"
