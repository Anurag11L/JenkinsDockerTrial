pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                // If you're storing your files in a Git repository, clone it
                git 'https://github.com/your-repo/your-project.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the Dockerfile
                    dockerImage = docker.build('my-simple-web-app')
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container exposing port 80
                    dockerImage.run('-p 8080:80')
                }
            }
        }

        // Optional: Push the Docker image to a Docker registry (if needed)
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'docker-credentials-id') {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
    
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
