pipeline {
    agent any

    stages {

        stage("first stage") {

            steps {
                 sh '''
                 set +e
                 which packer
                 which terraform
                 
                 '''
            }
        }

        stage("second stage") {

            steps {
                 sh '''
                 echo "fuck"
                 '''
            }
        }

        stage("third stage") {

            steps {
                 sh '''
                 echo "you"
                 '''
            }
        }
    }

    post {
        always {
            cleanWs()
        }

        success {
            echo "pipeline success"
        }

        failure {
            echo "pipeline failure"
        }
    }
}
