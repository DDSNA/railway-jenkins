# Use the official Jenkins LTS base image
FROM jenkins/jenkins:lts

# Set the user to root to allow package installation
USER root

# should be environment variables

ENV JENKINS_USER admin
ENV JENKINS_PASS admin123
# Install additional tools and dependencies (if needed)
RUN apt-get update && apt-get install -y \
    docker.io \
    git \
    curl \
    ruby \
    make \
    ansible \
    && rm -rf /var/lib/apt/lists/*
RUN echo $JENKINS_HOME
# Switch back to the Jenkins user
USER jenkins

# Set environment variables
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Copy additional configuration files (if any)
# COPY custom_jenkins_config.xml /var/jenkins_home/
ENV UID=1000
ENV GID=1000
# Expose Jenkins port
EXPOSE 8080

# Set the default command to run Jenkins
CMD ["jenkins.sh"]
