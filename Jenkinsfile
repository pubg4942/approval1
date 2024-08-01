pipeline {
    agent any

    stages {

        stage(linux_commands) {
            steps{
                sh '''
                pwd
                ls -la
                whoami
                '''
            }
        }

        stage(initialization) {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage(validation) {
            steps {
                sh '''
                terraform validate
                '''
            }
        }

        stage(plan) {
            steps {
                sh '''
                terraform plan
                '''
            }
        }

        stage(terraform_apply) {
            when {
                expression {
                    GIT_BRANCH == "origin/main"

                }
            }
            steps{
                sh '''
                terraform apply --auto-approve
                '''
            }
        }

        stage(testing_jenkins_env_variables) {
            steps {
                echo BUILD_NUMBER
                echo BUILD_ID
                echo BUILD_URL
                echo JENKINS_URL
                echo GIT_BRANCH
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo "pipeline is completed sucuessfully"
        }
        failure {
            echo "pipeline is failed"
        }
        aborted {
            echo "pipeline is aborted"
        }
        unsuccessful (
            echo "pipeline is unsuccessful"
        )
    }
}
