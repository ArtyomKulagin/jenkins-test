FROM openjdk:17

COPY target/jenkins-test-jar-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]