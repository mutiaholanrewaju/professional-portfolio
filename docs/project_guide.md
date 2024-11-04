# Project: Deploying a Portfolio Website on Google Cloud Run with CI/CD

## Project Overview
In this project, I developed and deployed a website on Google Cloud Run. The project involves setting up a multi-stage CI/CD pipeline to build, test, and deploy the code automatically. I used Docker to package the application, Cloud Build to handle building and pushing images, and GitHub Actions to set up continuous integration and delivery. By the end, I established a fully automated system that deploys changes to the cloud every time I push an update to GitHub.

## What You’ll Need
- **Google Cloud Platform (GCP) account**: You can start with Google’s free trial credits.
- **GitHub account**: This is where you’ll store your code and set up your CI/CD pipeline.
- **Basic familiarity with Docker and the terminal**.
## Step 1: Set Up Your Project Repository on GitHub

### Create a New Repository on GitHub
1. Go to GitHub, log in, and create a new repository. Name it something like `portfolio-website` or `flask-app-portfolio`.

### Clone the Repository
2. Clone the repository to your local machine so you can start adding files and organizing the project.

   Clone the repository of any static portfolio website you want to use and move the files and folders into your own cloned repository on your local:

   ```bash
   git clone https://github.com/your-username/portfolio-website.git
   cd portfolio-website
## Organize Project Files

- **README.md**: Add a README file to describe your project.

### Folder Structure
- For a static site (e.g., HTML, CSS, JS), place these files directly in the repository.
  
- For a Flask app, create a folder structure like this:

├── app/ │ ├── main.py # Your main Flask file │ ├── templates/ │ └── static/ └── Dockerfile

## Add a .gitignore File
Add a `.gitignore` file to exclude unnecessary files, such as `__pycache__`, `*.env`, or `node_modules/` (if applicable).

## Step 2: Build Your Application

### Develop Your Application
- **Static Site**: Add your HTML, CSS, and JavaScript files. 
- **Flask App**: If you’re building with Flask, create a simple app in `main.py`:

```python
# app/main.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Welcome to my portfolio!</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
