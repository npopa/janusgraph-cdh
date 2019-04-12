# janusgraph - Cloudera Parcel/CSD

### Building the project

* Install maven

``` shell
#Install maven (if you don't already have)
export MAVEN_VERSION=3.6.0
mkdir -p /usr/local/maven
wget "http://mirrors.ocf.berkeley.edu/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" -O - | tar -xz -C /usr/local/maven
ln -sf /usr/local/maven/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/local/bin/mvn

#Install git (if you don't already have)
yum install -y git

```

* Build 
``` shell
#clone repository
cd ~ && git clone https://github.com/npopa/janusgraph-cdh

#build repository
export JAVA_HOME=/usr/java/default
cd ~/janusgraph-cdh && mvn clean package

```

* Install CSD
``` shell
#copy the CSD to CM folder
#If it was built on the same host where CM resides then it can be copied directly.
#Else it needs to be scp-ed to CM host.
\cp ~/janusgraph-cdh/janusgraph-csd-cm6/target/JANUSGRAPH-0.3.1-CM6.jar /opt/cloudera/csd/

#restart CM & CM Service after that
#service cloudera-scm-server restart

```
* Install parcel

``` shell
cd ~/janusgraph-cdh/janusgraph-parcel/target && python -m SimpleHTTPServer 8001
```


* Create a dedicated `jgraph` hbase namespace that will contain all the hbase tables for JanusGraph. \
This is not required but it will keep things tidy in a crowded environment.

``` shell
# kinit hbase
# Create a namespace for the JanusGraph tables.
# Grant janusgraph group admin priviledges on it 
echo "create_namespace 'jgraph'"|hbase shell
echo "grant '@janusgraph','RWXCA', '@jgraph'"|hbase shell

```


