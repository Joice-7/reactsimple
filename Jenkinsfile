pipeline {
    agent any

    environment {
       PATH = "${env.PATH};C:\\WINDOWS\\System32;C:\\Program Files\\Docker\\Docker\\resources\\bin"
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
                    bat'npm run build'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image with a tag
                    bat 'docker build -t myimage:1.0 .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the image
                    bat'docker run -d -p 3000:3000 --name mycontainer myimage:1.0 .'
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
