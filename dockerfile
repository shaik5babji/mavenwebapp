FROM alpine
LABEL MAINTAINER babji
COPY target/mvnwebapp.war /usr/tomcat/webapps/
EXPOSE 8082
CMD ["catalina.sh","run"]

