stage('Docker Deploy') {
    steps {
        sh '''
        ssh admin@172.27.109.67 "
        cd ~/docker-app
        docker compose down
        docker compose up -d --build
        "
        '''
    }
}
