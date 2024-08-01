pipeline {
    agent any

    stages {

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

        stage(apply) {
            steps {
                sh '''
                terraform apply --auto-approve 
                '''
            }
        }

        stage(testing_jenkins_env_variables) {
            steps {
                echo BRANCH_NAME
                echo BUILD_NUMBER
                echo BUILD_ID
                echo BUILD_URL
                echo JENKINS_URL
            }
        }
    }
}
