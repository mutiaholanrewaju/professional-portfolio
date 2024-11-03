# Start from the official Nginx image  and use a lightweight web server to serve static files
FROM nginx:alpine

#Copy the content of the nginx config file into this nginx root file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy your website files into the Nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80 to access your website
EXPOSE 8080

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

