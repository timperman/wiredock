FROM anapsix/alpine-java:jre8

EXPOSE 8080

ENV WIREMOCK_VERSION 1.57

COPY scripts /
RUN chmod a+x /reset

RUN curl -SsL https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/${WIREMOCK_VERSION}/wiremock-${WIREMOCK_VERSION}-standalone.jar > wiremock-standalone.jar

ENTRYPOINT [ "java", "-jar", "wiremock-standalone.jar" ]
CMD [ "--verbose" ]
