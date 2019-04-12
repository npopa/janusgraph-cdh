# The Parcel

This parcel should be compatible with both CDH5 and CDH6 Cloudera distros. \
The parcel gets installed on `/opt/cloudera/parcels` and the internal layout looks like below:

* **janusgraph-0.3.1-hadoop2** - the ***unmodified*** distro downloaded from [github](https://github.com/JanusGraph/janusgraph/releases).\
Currently builds a parcel around JanusGraph-0.3.1-hadoop2.
* **lib** - helper lib files. 
  * janusgraph-compat-cdh5-1.0.0-SNAPSHOT.jar - work in progress. **Not used**.
  * jmx-json-javaagent.jar - intended for monitoring
* **meta** - parcel definition files. More information on this [here](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel).  

``` shell 

JANUSGRAPH
├── janusgraph-0.3.1-hadoop2
│   ├── bin
│   ├── changelog.adoc
│   ├── conf
│   ├── data
│   ├── elasticsearch
│   ├── examples
│   ├── ext
│   ├── javadocs
│   ├── lib
│   ├── LICENSE.txt
│   ├── log
│   ├── NOTICE.txt
│   ├── scripts
│   └── upgrade.adoc
├── lib
│   ├── janusgraph-compat-cdh5-1.0.0-SNAPSHOT.jar
│   └── jmx-json-javaagent.jar
└── meta
    ├── alternatives.json
    ├── janusgraph_env.sh
    ├── parcel.json
    └── release-notes.txt

```





