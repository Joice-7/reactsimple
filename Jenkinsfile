pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'myimage' // Replace with your Docker image name
    }
 tools {
        nodejs 'NodeJS' // Make sure this matches the name you used in Global Tool Configuration
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git 'https://github.com/Joice-7/reactsimple' 
            }
        }
        stage('Check npm Version') {
     steps {
         bat 'npm -v'
     }
 }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install Node.js dependencies
                    bat 'npm install'
                }
            }
        }

        stage('Build React App') {
            steps {
                script {
                    // Run the build command to bundle the app
                    bat 'npm run build'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image with a tag
                    bat 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the image
                    bat 'docker run -d -p 3000:3000 --name react-app-container $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build
            cleanWs()
        }
    }
}
