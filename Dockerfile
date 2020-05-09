FROM openjdk:8u212-jre
WORKDIR /app
COPY ./build/libs/*.jar ./app.jar
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [ "java", "-jar", "/app/app.jar"]
EXPOSE 8080
