# Use the official Apache image as the base
FROM httpd:2.4

# Copy the HTML file to the Apache web server directory
COPY ./Student_survey.html /usr/local/apache2/htdocs/index.html

# Expose port 80 for the application
EXPOSE 80
