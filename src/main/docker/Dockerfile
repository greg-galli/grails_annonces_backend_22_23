FROM openjdk:8
MAINTAINER John Doe "john.doe@example.com"

EXPOSE 8080

WORKDIR /app
COPY *.jar application.jar

CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/application.jar"]