Make sure the client configuration is deployed on the GW Gremlin Server roles before you start.

* [ConfiguredGraphFactory](https://docs.janusgraph.org/latest/configuredgraphfactory.html) samples
  * Start gremlin console on a GW role.
``` groovy
$ gremlin

         \,,,/
         (o o)
-----oOOo-(3)-oOOo-----
plugin activated: janusgraph.imports
plugin activated: tinkerpop.server
plugin activated: tinkerpop.utilities
plugin activated: tinkerpop.hadoop
plugin activated: tinkerpop.spark
plugin activated: tinkerpop.tinkergraph
gremlin>
```
   * Connect to remote Gremlin Server 
``` groovy
:remote connect tinkerpop.server /etc/janusgraph/conf/gremlin-client.yaml session
:remote console

```
```
...
plugin activated: tinkerpop.tinkergraph
gremlin> :remote connect tinkerpop.server /etc/janusgraph/conf/gremlin-client.yaml session
==>Configured ... -[87e94a2a-9a69-4a44-935d-70e7124da056]
gremlin> :remote console
==>All scripts will now be sent to Gremlin Server - [...]-[87e94a2a-9a69-4a44-935d-70e7124da056] - type ':remote console' to return to local mode
gremlin>
```

   * ... and create the GraphOfTheGods graph `gotg`. 
```
// dynamically create a graph configuration
namespace = "jgraph";[]
graphName = "gotg";[]
map = new HashMap();[]
map.put("storage.backend", "hbase");[]
map.put("graph.graphname", graphName);[]
map.put("storage.hbase.table",namespace+":"+graphName);[]

ConfiguredGraphFactory.createConfiguration(new MapConfiguration(map));[]

// list the configured graphs
ConfiguredGraphFactory.getGraphNames();

// open gotg graph
graph = ConfiguredGraphFactory.open(graphName);[]
GraphOfTheGodsFactory.loadWithoutMixedIndex(graph,true);[]
g = graph.traversal();[]

//do some basic tests
hercules = g.V().has('name', 'hercules').next();
g.V(hercules).out('father', 'mother').values('name');

g.V(hercules).out('father', 'mother').label();
hercules.label();

```

This should display something like below:
``` groovy
...
gremlin> namespace = "jgraph";[]
gremlin> graphName = "gotg";[]
gremlin> map = new HashMap();[]
gremlin> map.put("storage.backend", "hbase");[]
gremlin> map.put("graph.graphname", graphName);[]
gremlin> map.put("storage.hbase.table",namespace+":"+graphName);[]
gremlin>
gremlin> ConfiguredGraphFactory.createConfiguration(new MapConfiguration(map));[]
gremlin> ConfiguredGraphFactory.getGraphNames();
==>gotg
gremlin> graph = ConfiguredGraphFactory.open(graphName);[]
gremlin> GraphOfTheGodsFactory.loadWithoutMixedIndex(graph,true);[]
gremlin> g = graph.traversal();[]
gremlin>
gremlin> hercules = g.V().has('name', 'hercules').next();
==>v[8424]
gremlin> g.V(hercules).out('father', 'mother').values('name');
==>jupiter
==>alcmene
gremlin>
gremlin> g.V(hercules).out('father', 'mother').label();
==>god
==>human
gremlin> hercules.label();
==>demigod
gremlin>
...

```
* ... or create the `airroutes` graph.
``` groovy
namespace = "jgraph";[]
graphName = "airroutes";[]
map = new HashMap();[]
map.put("storage.backend", "hbase");[]
map.put("graph.graphname", graphName);[]
map.put("storage.hbase.table",namespace+":"+graphName);[]

ConfiguredGraphFactory.createConfiguration(new MapConfiguration(map));[]

// list the configured graphs
ConfiguredGraphFactory.getGraphNames();

// open airroutes graph
graph = ConfiguredGraphFactory.open(graphName);[]
graph.io(IoCore.graphml()).reader().create().readGraph(new URL("https://github.com/krlawrence/graph/raw/master/sample-data/air-routes-latest.graphml").openStream(), graph);
g = graph.traversal()

departure_airport="VIE"
arrival_airport="BIO"

g.V().has('code', departure_airport).repeat(out('route').simplePath()).times(2).has('code', arrival_airport).path().by('code').limit(5)
g.V().has('code', departure_airport).repeat(out('route').simplePath()).times(2).has('code', arrival_airport).path().by('code').count()

```


* JanusGraphFactory



