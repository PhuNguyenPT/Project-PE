FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY Shopping_Cart_API/pom.xml .
COPY Shopping_Cart_API/src ./src
RUN mvn clean install

FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/shopping-cart-api-0.0.1-SNAPSHOT.jar ./awazon.jar
EXPOSE 8080
CMD ["java", "-jar", "awazon.jar"]


