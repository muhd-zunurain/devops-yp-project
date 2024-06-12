FROM docker.io/library/maven:3.9.7-ibm-semeru-21-jammy as builder

WORKDIR /
COPY . .
RUN mvn clean package
RUN ls -lrt /target

FROM tomcat:9.0.89-jre21-temurin-jammy

COPY --from=builder /target/helloworld.war /usr/local/tomcat/webapps/helloworld.war

