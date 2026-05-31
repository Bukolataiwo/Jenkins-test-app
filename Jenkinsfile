pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy Docker App') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no admin@172.27.109.67 "
                cd ~/docker-app || exit

                echo 'Stopping old containers...'
                docker compose down

                echo 'Starting new containers...'
                docker compose up -d --build

                echo 'Deployment complete ✅'
                "
                '''
            }
        }

    }
}
