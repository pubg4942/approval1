pipeline {
    agent any

    stages {

        stage(initialization) {
            steps {
                terraform init
            }
        }

        stage(validation) {
            steps {
                terraform validate
            }
        }

        stage(plan) {
            steps {
                terraform plan
            }
        }

        stage(apply) {
            steps {
                terraform apply
            }
        }
    }
}
