FROM openjdk:8-jdk-alpine
EXPOSE 5000
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-Dcom.sun.management.jmxremote.local.only=false", "-Dcom.sun.management.jmxremote.ssl=false", "-Dcom.sun.management.jmxremote.authenticate=false", "-Dcom.sun.management.jmxremote.port=5000", "-Dcom.sun.management.jmxremote.rmi.port=5000", "-Dcom.sun.management.jmxremote.host=host.docker.internal", "-Djava.rmi.server.hostname=host.docker.internal", "-jar", "/app.jar"]


