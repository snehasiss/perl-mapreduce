#!/bin/bash
# mr.sh v1.0

JAR=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.2.0.jar
HSTREAMING="$HADOOP_HOME/bin/hadoop jar $JAR"

$HSTREAMING \
  -mapper 'mapper.pl' \
  -reducer 'reducer.pl' \
  -file mapper.pl \
  -file reducer.pl \
  -input /user/hduser/in/access* \
  -output /user/hduser/out/output
