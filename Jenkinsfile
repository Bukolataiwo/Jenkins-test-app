pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

    stage('Multi-Server Deploy') {
    steps {
        sh '''
        for server in 172.27.109.67 172.27.109.68
        do
            echo "Deploying to $server"

            ssh -o StrictHostKeyChecking=no admin@$server "
            cd ~/docker-app || exit
            docker compose down
            docker compose up -d --build
            "
        done
        '''
    }
}

