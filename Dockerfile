FROM docker.io/library/maven:eclipse-temurin as builder

WORKDIR /
COPY . .
RUN mvn clean package

FROM docker.io/library/tomcat:jre21-temurin-jammy

COPY --from=builder /target/devops-yp-project.war /usr/local/tomcat/webapps/ROOT.war

