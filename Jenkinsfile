def linux () {
    sh '''
    set +e
    which packer
    which terraform
    '''
}


pipeline {
    agent any

    stages {

        stage("first stage") {

            steps {
                script {
                    linux()
                }
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
