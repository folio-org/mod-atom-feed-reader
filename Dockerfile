# https://github.com/folio-org/folio-tools/tree/master/folio-java-docker/openjdk17
FROM folioci/alpine-jre-openjdk17:latest

# Install latest patch versions of packages: https://pythonspeed.com/articles/security-updates-in-docker/
USER root
RUN apk upgrade --no-cache
USER folio

# Copy your fat jar to the container; if multiple *.jar files exist the .dockerignore file excludes others
ENV APP_FILE mod-atom-feed-reader-fat.jar
# - should be a single jar file
ARG JAR_FILE=./target/*.jar
# - copy
COPY ${JAR_FILE} ${JAVA_APP_DIR}/${APP_FILE}

# Expose this port locally in the container.
EXPOSE 8081
