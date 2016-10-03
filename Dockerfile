FROM ageofmobile/gradle-docker:latest
ENV GRADLE_USER_HOME=/root

VOLUME /src
ADD . /src

WORKDIR /src
RUN gradle build

COPY build/libs/hello-service.jar /opt/app.jar

# Cleaning up temp files
RUN rm -rf /src && \
    rm -rf /usr/local/gradle

ENV SERVER_PORT 8080

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app.jar"]