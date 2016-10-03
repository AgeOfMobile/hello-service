FROM ageofmobile/gradle-docker:latest

RUN mkdir /src
ADD . /src

WORKDIR /src

ENV GRADLE_USER_HOME=/src
RUN gradle build

RUN ls builds/libs/
COPY build/libs/hello-service.jar /opt/app.jar

# Cleaning up temp files
RUN rm -rf /src && \
    rm -rf /usr/local/gradle

ENV SERVER_PORT 8080

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app.jar"]