properties([
    parameters([
        string(defaultValue: "helloworld", description: "input string", name: "string",),
    ])
])
pipeline {
    agent any

    stages {

        stage(linux_commands) {
            steps{
                sh '''
                pwd
                ls -la
                whoami
                echo "${string}"
                '''
            }
        }

        stage(initialization) {
            steps {
                sh '''
                terraform init
                terraform fmt
                terraform validate
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
            sh '''
            echo "pipeline is completed successfully"
            '''
        }
        failure {
            sh '''
            echo "pipeline is failed"
            '''
        }
        unsuccessful {
            sh '''
            echo "pipeline is unsuccessful"
            '''
        }
    }
}
