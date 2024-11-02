# Start from the official Nginx image  and use a lightweight web server to serve static files
FROM nginx:alpine

# Copy your website files into the Nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80 to access your website
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

