# Deploying a Portfolio Website on Google Cloud Run with CI/CD

## 1. Introduction
In this project, I developed and deployed a portfolio website on Google Cloud Run. The goal was to set up a multi-stage CI/CD pipeline that would automate the building, testing, and deployment of the application. This involved using Docker to package the application, Google Cloud Build for building and pushing images, and GitHub Actions for continuous integration and delivery. By the end of this project,the result is a fully automated workflow where updates are seamlessly deployed to the cloud with every GitHub push, streamlining the deployment process and enhancing site reliability.

## 2. Building the Dockerfile
To package my web application into a container, I created a Dockerfile with the following [content:](./Dockerfile)

### Key Details
- I chose the `nginx:alpine` image as the base for its lightweight characteristics, making it suitable for serving static files.
- I copied my custom `nginx.conf` [file](./nginx.conf) to the appropriate directory to configure Nginx as needed for my application.
- The command `COPY . /usr/share/nginx/html` ensured that all necessary website files were included in the Docker image.
- I exposed port 8080 to allow access to the website, as the application was configured to run on this port instead of the default port 80.
- Finally, the command to start Nginx was included to ensure the server would run when the container started.

## 3. Steps in My GitHub Actions Workflow
For the CI/CD process, I set up a GitHub Actions workflow defined in a file located [here](.github/workflows/deploy.yml). 

### Workflow Configuration Details
- The workflow is triggered whenever I push changes to the main branch.
- I specified that the jobs would run on the latest Ubuntu environment.
- The first step involved checking out the code using the `actions/checkout` action.
- I authenticated with Google Cloud Platform (GCP) using the `google-github-actions/auth` action and passed in my GCP credentials stored in GitHub secrets.
- I then triggered Google Cloud Build to submit the build, tagging the image for my portfolio site.
- Finally, I deployed the built image to Cloud Run, ensuring it was publicly accessible by using the `--allow-unauthenticated` flag.

### 4. Challenges and Mistakes Encountered
During the course of this project, I encountered several challenges:

- **Dockerfile Naming Issue**: Initially, I named my Dockerfile incorrectly as "docker file," which led to the build process failing to locate it. I corrected the name to "Dockerfile," which resolved the issue.

- **Nginx Port Configuration**: I faced a problem with the default Nginx server serving from port 80 instead of the intended port 8080. To resolve this, I needed to create a custom [Nginx configuration file](./nginx.conf) that specified port 8080 for the server to listen on and referenced in my Dockerfile.

- **GCP Logging Bucket Permission Issue**: I encountered permission issues when trying to use the default GCP logging bucket. As a solution, I created a new GCP bucket specifically for my logs, which allowed my CI/CD process to function correctly.

- **Service Account Permissions**: It became clear that the service account associated with my project needed specific permissions for GitHub Actions to interact with GCP. I modified the roles of the service account to ensure it had the necessary permissions to execute the required actions.

### 5. Conclusion
By the end of this project, I successfully established a CI/CD pipeline that automated the deployment of my portfolio website on Google Cloud Run. Despite facing several challenges, I learned valuable lessons about Docker, GitHub Actions, and Google Cloud services. This project not only enhanced my technical skills but also provided me with a robust automated deployment system for future projects.


## Personal Notes
### Here is the link to my  [live portfolio website on Cloud Run](https://portfolio-site-738832657678.us-central1.run.app/)
### I might stop the hosting of this portfolio website on cloud run the future to avoid incurring cost but the portfolio website can still be found on [github](https://mutiaholanrewaju.github.io/professional-portfolio/)

### Interested in developing this project. Check out this [documentation](./Project%20Guide_%20Deploying%20a%20Portfolio%20Website%20on%20Google%20Cloud%20Run%20with%20CI_CD.pdf)

### Sample Static Portfolio website
You can clone this [repository](https://github.com/geetanshum/Portfolio.git) as your baseline to start developing your own portfolio
