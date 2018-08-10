https://prestodb.io/presto-admin/docs/current/installation/presto-configuration.html

docker run --rm --privileged foo sh -c "/bin/echo 3 > /proc/sys/vm/drop_caches"
docker build -t foo .
docker run -it -p 8080:8080 boo




mkdir catalog
echo '#connector.name=jmx' > catalog/jmx.properties
echo 'connector.name=localfile
#presto-logs.http-request-log.location
#presto-logs.http-request-log.pattern' > catalog/localfile.properties
echo 'coordinator=true
node-scheduler.include-coordinator=true
http-server.http.port=8080
query.max-memory=300MB
query.max-memory-per-node=300MB
discovery-server.enabled=true
discovery.uri=http://127.0.0.1:8080' > config.properties
echo '-server
-Xmx1G
-XX:+UseG1GC
-XX:G1HeapRegionSize=32M
-XX:+UseGCOverheadLimit
-XX:+ExplicitGCInvokesConcurrent
-XX:+HeapDumpOnOutOfMemoryError
-XX:+ExitOnOutOfMemoryError' > jvm.config
echo 'com.facebook.presto=DEBUG' > log.properties
echo 'node.environment=production
node.id=ffffffff-ffff-ffff-ffff-ffffffffffff
node.data-dir=/var/presto/data' > node.properties