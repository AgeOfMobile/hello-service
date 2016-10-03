FROM ageofmobile/gradle-docker:latest

ENV GRADLE_USER_HOME=/root

RUN mkdir /src
ADD . /src

WORKDIR /src
RUN gradle build

COPY build/libs/eureka-1.0-SNAPSHOT.jar /opt/app.jar

# Cleaning up temp files
RUN rm -rf /src
RUN rm -rf /usr/local/gradle

ENV SERVER_PORT 8080

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app.jar"]