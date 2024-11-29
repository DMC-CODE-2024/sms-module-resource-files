#!/bin/bash
#set -x

#take back up of existing release
tar -xzvf sms_mno_notification_module_1.0.0.tar.gz >>sms_mno_notification_module_1.0.0_untar_log.txt
mkdir -p ${APP_HOME}/sms_mno_module/sms_mno_notification
mkdir -p ${LOG_HOME}/sms_mno_module/sms_mno_notification


mv sms_mno_notification_module_1.0.0/sms_mno_notification_1.0.0.jar ${RELEASE_HOME}/binary/
#mv national_whitelist_edr_1.0.0/log4j2.xml ${RELEASE_HOME}/global_config
mv sms_mno_notification_module_1.0.0/*  ${APP_HOME}/sms_mno_module/sms_mno_notification/

cd ${APP_HOME}/sms_mno_module/sms_mno_notification
ln -sf ${RELEASE_HOME}/binary/sms_mno_notification_1.0.0.jar sms_mno_notification.jar
ln -sf ${RELEASE_HOME}/global_config/log4j2.xml log4j2.xml

chmod +x *.sh


echo "++++++++++++Application Installation completed+++++++++++"

