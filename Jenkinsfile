pipeline {
    agent any

    environment {
        PATH = "${env.PATH};C:\\WINDOWS\\System32;C:\\Program Files\\Docker\\Docker\\resources\\bin"
        
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git 'https://github.com/Joice-7/reactsimple' 
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    bat 'docker build -t myimage:1.0 .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat 'docker run -d -p 3000:3000 --name mycontainer myimage:1.0 .'
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
