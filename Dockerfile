FROM openjdk:11 as intermediate
RUN apt-get update && apt-get install -y maven
WORKDIR /
COPY src /src
COPY pom.xml /pom.xml
RUN mvn package

FROM tomcat:9.0.1-jre8-alpine 
VOLUME warfiles
COPY --from=intermediate /target/ /usr/local/tomcat/webapps/
COPY catalina.properties /usr/local/tomcat/conf/catalina.properties
CMD ["catalina.sh", "run"]
EXPOSE 8080