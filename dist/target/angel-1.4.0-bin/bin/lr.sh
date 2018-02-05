#!/bin/sh
export HADOOP_HOME=/usr/hdp/current/hadoop-client

#export HADOOP_USER_NAME=mapred
sudo -u hdfs hdfs dfs -rm -r /apps/angel/test
sudo -u hdfs hdfs dfs -mkdir /apps/angel/test
sudo -u hdfs hdfs dfs -chmod -R a+wrx /apps/angel/

#sudo -u mapred HADOOP_HOME=/usr/hdp/current/hadoop-client 
./angel-submit \
    --angel.app.submit.class com.tencent.angel.example.quickStart.QSLRRunner \
    --angel.train.data.path "/apps/angel/lr_data" \
    --angel.log.path "/apps/angel/test/log" \
    --angel.save.model.path "/apps/angel//test/model" \
    --action.type train \
    --ml.data.type libsvm \
    --ml.feature.num 1024 \
    --angel.job.name LR_test \
    --angel.am.memory.gb 2 \
    --angel.worker.memory.gb 2 \
    --angel.ps.memory.gb 2 \
    --angel.ps.number 2 \
