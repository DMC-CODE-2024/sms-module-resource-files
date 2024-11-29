#!/bin/bash

module_name="sms_mno_notification"
operator_list="cellcard,smart,seatel,metfone"

########### DO NOT CHANGE ANY CODE OR TEXT AFTER THIS LINE #########


. ~/.bash_profile

process="${module_name}.jar"


for i in ${operator_list//,/ }
  do

    operator=$i

    pid=`ps -ef | grep $process | grep $operator | grep java | grep $module_name | grep -v grep | awk '{print $2}'`

    if [ "$pid" == "" ]
    then

      echo "No process running for $module_name of $operator !!!"

    else
      kill $pid
      echo "PID $pid for process $module_name of $operator is stopped !"

    fi

done

