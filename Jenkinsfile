pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone your repository (adjust the URL as needed)
                git branch: 'main', url: 'https://github.com/Anurag11L/JenkinsDockerTrial'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t my-docker-image .'
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container (detached mode)
                    bat 'docker run -d -p 80:80 my-docker-image'
                }
            }
        }
    }

    post {
        always {
            // Clean up (optional)
            script {
                // Stop and remove the container if it exists
                bat 'docker stop $(docker ps -q --filter ancestor=my-docker-image) || exit 0'
                bat 'docker rmi my-docker-image || exit 0'
            }
        }
    }
}
