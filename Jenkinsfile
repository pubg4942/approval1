pipeline {
    agent any

    stages {

        stage("first stage") {

            steps {
                 sh '''
                 echo "bitch"
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
