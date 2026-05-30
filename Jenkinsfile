pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                sudo cp index.html /usr/share/nginx/html/index.html
                '''
            }
        }
    }
}
