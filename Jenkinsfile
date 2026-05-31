pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Nginx') {
            steps {
                sh '''
                sudo dnf install nginx -y
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                sudo cp index.html /usr/share/nginx/html/index.html
                '''
            }
        }

        stage('Restart Nginx') {
            steps {
                sh '''
                sudo systemctl enable nginx
                sudo systemctl restart nginx
                '''
            }
        }
    }
}
