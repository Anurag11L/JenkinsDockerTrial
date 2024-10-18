pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-simple-web-app"
        PORT_MAPPING = "8080:80"
    }

    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Branch to build')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: "${params.BRANCH_NAME}", url: 'https://github.com/Anurag11L/JenkinsDockerTrial'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        dockerImage = docker.build("${IMAGE_NAME}:${env.BUILD_ID}")
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
                        // Stop and remove any existing container
                        sh "docker stop ${IMAGE_NAME} || true"
                        sh "docker rm ${IMAGE_NAME} || true"
                        
                        // Run the new container
                        dockerImage.run("-p ${PORT_MAPPING} --name ${IMAGE_NAME}")
                    } catch (Exception e) {
                        echo "Docker Run Failed: ${e.getMessage()}"
                        error("Docker run failed. Check the logs for details.")
                    }
                }
            }
        }

        // Optional: Add a testing stage
        stage('Test') {
            steps {
                script {
                    // Add your testing commands here
                }
            }
        }
    }

    post {
        always {
            cleanWs()
            // Optional: Clean up old images
            sh "docker rmi $(docker images -f 'dangling=true' -q) || true"
        }
        success {
            // Optional: Notify success
            echo "Build succeeded!"
        }
        failure {
            // Optional: Notify failure
            echo "Build failed!"
        }
    }
}
