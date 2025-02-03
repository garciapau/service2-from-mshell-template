FROM 325714046698.dkr.ecr.eu-west-1.amazonaws.com/skyscanner/java-stable:3.2.1

COPY build/libs/microservice-shell-java.jar $SKYSCANNER_HOME

COPY dev.yml $SKYSCANNER_HOME
COPY sandbox.yml $SKYSCANNER_HOME
COPY prod.yml $SKYSCANNER_HOME

COPY gradle.properties $SKYSCANNER_HOME

WORKDIR $SKYSCANNER_HOME

ARG BUILD_NUMBER
ARG VCS_REF

LABEL org.label-schema.name="mshell-template" \
  org.label-schema.description="Template to easily build a service in 5 minutes" \
  org.label-schema.vcs-url="https://github.skyscannertools.net/skyscanner/mshell-template" \
  org.label-schema.usage="README.md" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vendor="Skyscanner" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.version="${BUILD_NUMBER}"

CMD exec /usr/bin/exec_java -jar microservice-shell-java.jar server ${CONFIGURATION_FILE_NAME:-dev.yml}
