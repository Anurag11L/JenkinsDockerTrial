# Use an official Nginx image from DockerHub
FROM nginx:alpine

# Copy your index.html to the default Nginx directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
