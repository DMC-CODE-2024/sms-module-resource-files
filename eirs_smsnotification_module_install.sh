#!/bin/bash
set -x
conffile=/u01/eirsapp/configuration/configuration.properties

#take back up of existing release
cd ${APP_HOME}/SmsService/
mv ${APP_HOME}/SmsService/SmsService.jar SmsService.jar_$(date +%Y%m%d) 
mv ${APP_HOME}/SmsService/application.properties application.properties_$(date +%Y%m%d) 

cd ${APP_HOME}/Release
#Untar the New release
tar -xzvf SMS_2.3.1.3.tar.gz
#Copy Reloase to /u01/eirsapp/SmsService DIrectory
cp -r SMS_2.3.1.3/* ${APP_HOME}/SmsService/
#Start Installation process for CallBack
cd ${APP_HOME}/SmsService/SmsCallback/
mv ${APP_HOME}/SmsService/SmsCallback/callbackService.jar callbackService.jar_$(date +%Y%m%d)

cd ${APP_HOME}/Release
#Untar the New release
tar -xzvf SMS_Callback.tar.gz
#Copy Reloase to /u01/eirsapp/SmsService/SmsCallback DIrectory
cp -r SMS_Callback/* ${APP_HOME}/SmsService/SmsCallback/

echo 

"++++++++++++Application Installation completed+++++++++++"

