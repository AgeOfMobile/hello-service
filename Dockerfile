FROM ageofmobile/gradle-docker:latest

ENV GRADLE_USER_HOME=/root

RUN mkdir /src
ADD . /src

WORKDIR /src
ARG API_URL
RUN echo "gradle build" > build.sh
RUN chmod +x ./build.sh
RUN ./build.sh

COPY build/libs/eureka-1.0-SNAPSHOT.jar /opt/eureka/eureka-1.0-SNAPSHOT.jar

# Cleaning up temp files
RUN rm -rf /src
RUN rm -rf /usr/local/gradle

EXPOSE 8080
ENV SERVER_PORT 8080
ENTRYPOINT ["java", "-jar", "/opt/eureka/eureka-1.0-SNAPSHOT.jar"]