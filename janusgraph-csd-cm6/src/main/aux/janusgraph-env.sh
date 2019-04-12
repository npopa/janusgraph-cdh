#!/bin/bash

export JANUSGRAPH_BIN=${JANUSGRAPH_HOME}/bin
export JANUSGRAPH_CFG=${JANUSGRAPH_HOME}/conf/gremlin-server
export JANUSGRAPH_LIB=${JANUSGRAPH_HOME}/lib
export JANUSGRAPH_EXT=${JANUSGRAPH_HOME}/ext


# Initialize classpath to $CFG
JANUSGRAPH_CLASSPATH="$JANUSGRAPH_CFG"

# Add the slf4j-log4j12 binding
JANUSGRAPH_CLASSPATH="$JANUSGRAPH_CLASSPATH":$(find -L $JANUSGRAPH_LIB -name 'slf4j-log4j12*.jar' | sort | tr '\n' ':')

# Add the jars in $JANUSGRAPH_LIB that start with "janusgraph" first
JANUSGRAPH_CLASSPATH="$JANUSGRAPH_CLASSPATH":$(find -L $JANUSGRAPH_LIB -name 'janusgraph*.jar' | sort | tr '\n' ':')

# Add the remaining jars in $JANUSGRAPH_LIB.
#TODO - need to check hbase-shaded-* removal and add the CDH ones
#               \! -name 'hbase-shaded-*' " \
JANUSGRAPH_CLASSPATH="$JANUSGRAPH_CLASSPATH":$(find -L $JANUSGRAPH_LIB -name '*.jar' \
                \! -name 'janusgraph*' \
                \! -name 'slf4j-log4j12*.jar' | sort | tr '\n' ':')
# Add the jars in $JANUSGRAPH_EXT (at any subdirectory depth)
JANUSGRAPH_CLASSPATH="$JANUSGRAPH_CLASSPATH":$(find -L $JANUSGRAPH_EXT -name '*.jar' | sort | tr '\n' ':')
# Add hbase configuration
JANUSGRAPH_CLASSPATH="$JANUSGRAPH_CLASSPATH":"/etc/hbase/conf"

export JANUSGRAPH_CLASSPATH

# Below this line is Cloudera Manager configured content, above is parcel default
