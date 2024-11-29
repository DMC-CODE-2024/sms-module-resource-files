#!/bin/bash

module_name="sms_mno_notification"
main_module="sms_mno" #keep it empty "" if there is no main module 
log_level="INFO" # INFO, DEBUG, ERROR
operator_list="cellcard,smart,seatel,metfone"

########### DO NOT CHANGE ANY CODE OR TEXT AFTER THIS LINE #########


. ~/.bash_profile

build="${module_name}.jar"


for i in ${operator_list//,/ }
  do

    operator=$i

    pid=`ps -ef | grep $build | grep java | grep $operator | grep $module_name | grep -v grep | awk '{print $2}'`

    if [ "${pid}" != "" ]  ## Process is currently running
    then
      echo "${module_name} process is currently running with PID ${pid} ..."

    else  ## No process running

      if [ "${main_module}" == "" ]
      then
         build_path="${APP_HOME}/${module_name}_module"
         log_path="${LOG_HOME}/${module_name}_module"
      else
         if [ "${main_module}" == "utility" ] || [ "${main_module}" == "api_service" ] || [ "${main_module}" == "gui" ]
         then
           build_path="${APP_HOME}/${main_module}/${module_name}"
           log_path="${LOG_HOME}/${main_module}/${module_name}"
         else
           build_path="${APP_HOME}/${main_module}_module/${module_name}"
           log_path="${LOG_HOME}/${main_module}_module/${module_name}"
         fi
      fi

      cd ${build_path}

      ## Starting the process

      echo "Starting ${module_name} module for ${operator} ..."

      java -Dlog4j.configurationFile=file:./log4j2.xml -Dlog.path=${log_path} -Dmodule.name=${module_name}_${operator} -Dlog.level=${log_level} -Dspring.config.location=file:./application.properties,file:${commonConfigurationFile} -jar ${build} ${operator} 1>/dev/null 2>${log_path}/${module_name}_${operator}.error &

      ## check if process started successfully or not

      pid=`ps -ef | grep $build | grep java | grep $operator | grep $module_name | grep -v grep | awk '{print $2}'`
      if [ "$pid" == "" ]
      then

        echo "Failed to start $module_name proccess for $operator !!!"

      else

        echo "$module_name process for $operator is started successfully with PID ${pid} ..."

      fi

    fi

done
