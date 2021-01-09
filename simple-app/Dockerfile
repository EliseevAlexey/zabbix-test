#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /src
COPY pom.xml .
RUN mvn -f /pom.xml clean package


#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /target/*.jar app.jar
ENV PORT=5000
ARG ZABBIX_SERVER_IP
ENV ZBX_HOST=$ZABBIX_SERVER_IP
EXPOSE $PORT
ENTRYPOINT java \
    -Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.port=$PORT \
    -Dcom.sun.management.jmxremote.rmi.port=$PORT \
    -Djava.rmi.server.hostname=$ZBX_HOST \
    -jar /app.jar
