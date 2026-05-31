pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy Remote') {
            steps {
                sh '''
                scp -o StrictHostKeyChecking=no deploy.sh admin@172.27.109.67:/tmp/deploy.sh

                ssh -o StrictHostKeyChecking=no admin@172.27.109.67 "
                chmod +x /tmp/deploy.sh
                /tmp/deploy.sh
                "
                '''
            }
        }
    }
}
``
