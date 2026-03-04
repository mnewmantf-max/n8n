# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Switch to root user to install system dependencies
USER root

# Update packages and install ffmpeg (example dependency)
RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*

# Create custom directory for community nodes and set permissions
RUN mkdir -p /home/node/.n8n/custom/node_modules && \
    chown -R node:node /home/node/.n8n/custom

# Switch back to the non-root 'node' user for security
USER node

# Set the working directory to the default n8n home
WORKDIR /home/node

# You can copy local custom nodes if you have them, e.g.,
# COPY ./custom_nodes /home/node/.n8n/custom/node_modules/custom_nodes

# Use the default entrypoint and CMD from the base image
# The base image will start n8n when the container runs
