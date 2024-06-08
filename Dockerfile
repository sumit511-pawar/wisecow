# Using Alpine as it is lightweight and less vulnerable base image
FROM bash:4.4

# Setting the working directory inside the container
WORKDIR /app

# Coping script into the container
COPY wisecow.sh /app

# Adding testing repo as cowsay package is not available in community main repo
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache cowsay fortune netcat-openbsd

# Making the script executable
RUN chmod +x /app/wisecow.sh

# Expose port 4499
EXPOSE 4499

# Define the entry point for the container
ENTRYPOINT ["/app/wisecow.sh"]
