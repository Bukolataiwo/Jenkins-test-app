pipeline {
    agent any

    parameters {
        choice(
            name: 'ENV',
            choices: ['dev', 'prod', 'both'],
            description: 'Select environment to deploy'
        )
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Deploy Application') {
            steps {
                script {

                    if (params.ENV == 'dev') {

                        echo "Deploying to DEV server..."

                        sh '''
                        ssh -o StrictHostKeyChecking=no admin@172.27.109.67 "
                        cd ~/docker-app || exit
                        docker compose down
                        docker compose up -d --build
                        "
                        '''

                    } else if (params.ENV == 'prod') {

                        echo "Deploying to PROD server..."

                        sh '''
                        ssh -o StrictHostKeyChecking=no admin@172.27.109.68 "
                        cd ~/docker-app || exit
                        docker compose down
                        docker compose up -d --build
