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
                scp -o StrictHostKeyChecking=no index.html admin@172.27.109.67:/tmp/index.html

                ssh -o StrictHostKeyChecking=no admin@172.27.109.67 "
                sudo cp /tmp/index.html /usr/share/nginx/html/index.html
                sudo systemctl restart nginx
                "
                '''
            }
        }
    }
}
