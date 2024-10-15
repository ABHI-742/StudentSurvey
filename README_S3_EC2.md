# Name:- Abhi Venkata Sri Krishna Devarayalu Anumanchi
# GID:- G01459507
# Sub:- SWE 645 Assignment - 1 

# Hosting a Static Website on Amazon S3

## Step 1: Create a Bucket
- In the AWS S3 console, create a new bucket with a unique name.

## Step 2: Enable Static Website Hosting
- Under "Properties" in your bucket settings, enable **Static website hosting** and configure the hosting options.

## Step 3: Edit Block Public Access Settings
- Go to the "Permissions" tab and disable **Block all public access**.

## Step 4: Add a Bucket Policy
- Add a bucket policy to allow public read access to your content.

Example policy:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::swe645-hw1-g01459507/*"
    }
  ]
}
```

## Step 5: Configure an Index Document
- Set `index.html` as the index document.

## Step 6: Configure an Error Document
- set an error document (e.g., `error.html`).

## Step 7: Upload Files
- Upload `Student_survey.html`, images like `IMG_8012.jpg`, `index.html`, and more.

## Step 8: Test Your Website Endpoint
- Access your website through the provided S3 endpoint URL.http://swe645-hw1-g01459507.s3-website-us-east-1.amazonaws.com/



# Student Survey Web Application on EC2 Instances

## Overview

This project is a simple Student Survey web application designed to gather feedback from students. It consists of an HTML form that captures various information. The application is deployed on an Amazon EC2 instance using Apache2 as the web server.

## Prerequisites

Before deploying the application, ensure you have the following:

- An AWS account.
- An EC2 instance running (preferably with Ubuntu).
- A key pair for SSH access.
- Basic knowledge of SSH and command line operations.

## Deployment Steps for EC2 Instances.

1. **Launch an EC2 Instance**
   - Log in to AWS Management Console.
   - Navigate to the EC2 Dashboard.
   - Click on "Launch Instance."
   - Choose an Amazon Machine Image (AMI) such as Ubuntu Server.
   - Select instance type (e.g., t2.micro for free tier).
   - Configure instance details and security group to allow HTTP and SSH access.
   - Review and launch the instance, and download the key pair.

2. **Connect to Your EC2 Instance**
   - Open a terminal (or Command Prompt on Windows).
   - Connect using SSH:
     ```bash
     ssh -i "C:/Users/Abhi/Desktop/SWE_645/testkey.pem" ubuntu@54.152.0.132
     ```

3. **Install Apache Web Server**
   - Update package list and install Apache:
     ```bash
     sudo apt update
     sudo apt install apache2 -y
     ```

4. **Copy Your HTML File to the Server**
   - Use `scp` to transfer your HTML file:
     ```bash
     scp -i  "C:/Users/Abhi/Desktop/SWE_645/testkey.pem" "C:/Users/Abhi/Desktop/SWE_645/Student_survey.html" ubuntu@54.152.0.132:/var/www/html/
     ```

5. **Set the Default Page**
   - Rename your HTML file to `index.html`:
     ```bash
     sudo mv /var/www/html/Student_survey.html /var/www/html/index.html
     ```

6. **Adjust Permissions**
   - Ensure the web server can read the file:
     ```bash
        sudo chown -R ubuntu:ubuntu /var/www/html
     ```

## Accessing the Application

Open a web browser and navigate to your instance’s public IP address:http://54.152.0.132

