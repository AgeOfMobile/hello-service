FROM ageofmobile/gradle-docker:latest
ENV GRADLE_USER_HOME=/src

VOLUME /src
ADD . /src

WORKDIR /src
RUN gradle build

RUN ls .
COPY build/libs/hello-service.jar /opt/app.jar

# Cleaning up temp files
RUN rm -rf /src && \
    rm -rf /usr/local/gradle

ENV SERVER_PORT 8080

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app.jar"]