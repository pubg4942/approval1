pipeline {
    agent any
    
    stages {
        stage ('terraform worflow') {
            steps {
                sh '''
                terraform init
                terraform validate
                terraform plan
                '''
            }
        }
    }
    
    post {
        cleanup {
            cleanWs()
        }
    }
}
