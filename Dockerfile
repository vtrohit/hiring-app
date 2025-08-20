# Use a modern Tomcat base image (Java 11, Tomcat 9 LTS)
FROM tomcat:9.0-jdk11

# Define environment variables for Nexus repository and the artifact to download
ENV NEXUS_REPO_URL="http://54.157.190.6:8081/repository/hiring-app/"
ENV ARTIFACT_PATH="junit/hiring/0.1/hiring-0.1.war"

# Remove default ROOT app (optional, keeps Tomcat clean)
RUN rm -rf /usr/local/tomcat/webapps/*

# Download WAR file from Nexus and place it in Tomcat's webapps directory
ADD ${NEXUS_REPO_URL}${ARTIFACT_PATH} /usr/local/tomcat/webapps/hiring.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
