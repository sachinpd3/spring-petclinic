FROM maven as build
WORKDIR /app
COPY pom.xml /app
COPY src /app/src
RUN mvn package -DskipTests


FROM eclipse-temurin:17-jdk-alpine
workdir /spring
COPY --from=build app/target/*.jar app.jar
CMD  java -jar app.jar
EXPOSE 8080
