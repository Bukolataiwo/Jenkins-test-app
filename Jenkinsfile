stage('Deploy Remote') {
    steps {
        sh '''
        scp index.html admin@172.27.109.67:/tmp/index.html

        ssh admin@172.27.109.67 "
        sudo cp /tmp/index.html /usr/share/nginx/html/index.html
        sudo systemctl restart nginx
        "
        '''
    }
}
