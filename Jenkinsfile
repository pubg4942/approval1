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
                    JENKINS_URL = "http://localhost:8080/"
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
                echo GIT_LOCAL_BRANCH
            }
        }
    }
}
