FROM icr.io/appcafe/open-liberty:kernel-slim-java11-openj9-ubi

COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml
RUN features.sh

COPY --chown=1001:0 target/acmeair-java-2.0.0-SNAPSHOT.war /config/apps/

RUN configure.sh 
