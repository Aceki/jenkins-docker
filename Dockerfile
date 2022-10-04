FROM jenkins/jenkins:2.346.3-jdk11

ARG JENKINS_PLUGINS="blueocean:1.25.6 docker-workflow:1.29 cobertura:1.17 code-coverage-api:3.2.0 htmlpublisher:1.31"

USER root

WORKDIR /home

COPY install-docker.sh .
RUN bash install-docker.sh
RUN jenkins-plugin-cli --plugins ${JENKINS_PLUGINS}

VOLUME ["/var/jenkins_home"]

EXPOSE 8080
EXPOSE 50000
