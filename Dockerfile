# Using the official OpenJDK 1.8 image as the base image
FROM openjdk:8-jdk-alpine

# Environment variables
ENV AUTH_ENABLED=true
ENV SENTINEL_DASHBOARD_AUTH_USERNAME=sentinel
ENV SENTINEL_DASHBOARD_AUTH_PASSWORD=sentinel
ENV SENTINEL_DASHBOARD_APP_HIDE_APP_NO_MACHINE_MILLIS=0
ENV SENTINEL_DASHBOARD_REMOVE_APP_NO_MACHINE_MILLIS=0
ENV SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS=60000
ENV SENTINEL_DASHBOARD_AUTO_REMOVE_MACHINE_MILLIS=0
ENV SERVER_SERVLET_SESSION_COOKIE_NAME=sentinel_dashboard_cookie
 
# Copy JAR package into container
COPY sentinel-dashboard-1.8.6.jar /app/sentinel-dashboard.jar
 
# Working directory
WORKDIR /app

# Expose ports
EXPOSE 8080 8719
 
CMD java -jar -Dauth.enabled=${AUTH_ENABLED} -Dsentinel.dashboard.auth.username=${SENTINEL_DASHBOARD_AUTH_USERNAME} -Dsentinel.dashboard.auth.password=${SENTINEL_DASHBOARD_AUTH_PASSWORD} -Dsentinel.dashboard.app.hideAppNoMachineMillis=${SENTINEL_DASHBOARD_APP_HIDE_APP_NO_MACHINE_MILLIS} -Dsentinel.dashboard.removeAppNoMachineMillis=${SENTINEL_DASHBOARD_REMOVE_APP_NO_MACHINE_MILLIS} -Dsentinel.dashboard.unhealthyMachineMillis=${SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS} -Dsentinel.dashboard.autoRemoveMachineMillis=${SENTINEL_DASHBOARD_AUTO_REMOVE_MACHINE_MILLIS} -Dserver.servlet.session.cookie.name=${SERVER_SERVLET_SESSION_COOKIE_NAME} sentinel-dashboard.jar