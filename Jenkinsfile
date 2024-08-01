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
                terraform apply
                '''
            }
        }
    }
}
