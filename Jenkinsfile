pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') // Using DockerHub credentials stored in Jenkins
    }
    stages {
        stage('Build') {
            steps {
                sh 'rm -rf *.war'  // Assuming you meant to clean up old WAR files
                sh 'jar cvf StudentSurvey.war .'  // Create the WAR file
                sh 'docker build -t abhi7422/student_survey:latest .'  // Build Docker image
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'  // Login to DockerHub using credentials
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                sh 'docker push abhi7422/student_survey:latest'  // Push the built Docker image
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Update the deployment image and monitor the rollout
                sh 'kubectl set image deployment/swe645deploy container-0=abhi7422/student_survey:latest -n default'
                sh 'kubectl rollout status deployment/swe645deploy -n default'
            }
        }
    }

    post {
        always {
            sh 'docker logout'  // Always logout from DockerHub after the pipeline
        }
    }
}
