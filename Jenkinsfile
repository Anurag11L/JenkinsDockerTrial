pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                // If you're storing your files in a Git repository, clone it
                git branch: 'main', url: 'https://github.com/Anurag11L/JenkinsDockerTrial'
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

    }
    
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
