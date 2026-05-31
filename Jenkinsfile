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

                        sh """
                        ssh -o StrictHostKeyChecking=no admin@172.27.109.67 '
                        cd ~/docker-app || exit
                        docker compose down
                        docker compose up -d --build
                        '
                        """

                    } else if (params.ENV == 'prod') {

                        echo "Deploying to PROD server..."

                        sh """
                        ssh -o StrictHostKeyChecking=no admin@172.27.109.68 '
                        cd ~/docker-app || exit
                        docker compose down
                        docker compose up -d --build
                        ' || echo "PROD server not reachable, skipping..."
                        """

                    } else {

                        echo "Deploying to BOTH servers..."

                        sh """
                        for server in 172.27.109.67 172.27.109.68
                        do
                            echo "Deploying to \$server"

                            ssh -o StrictHostKeyChecking=no admin@\${server} '
                            cd ~/docker-app || exit
                            docker compose down
                            docker compose up -d --build
                            ' || echo "Skipping \$server (not reachable)"
                        done
                        """

                    }
                }
            }
        }

    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed. Check logs."
        }
    }
}
