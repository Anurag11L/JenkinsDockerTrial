pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Anurag11L/JenkinsDockerTrial'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        dockerImage = docker.build('my-simple-web-app')
                    } catch (Exception e) {
                        echo "Docker Build Failed: ${e.getMessage()}"
                        error("Docker build failed. Check the logs for details.")
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    try {
                        dockerImage.run('-p 8080:80')
                    } catch (Exception e) {
                        echo "Docker Run Failed: ${e.getMessage()}"
                        error("Docker run failed. Check the logs for details.")
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
