
pipeline {
    agent any

    parameters {
        string(name: "string", defaultValue: "helloworld", description: "enter string input")
        choice(name: "region", choices: ["us-west-2", "us-east-1", "ap-sout-1", "eu-entral-1"], description: "select region")
        booleanParam(name: "execute_in_prod", defaultValue: true, description: "whether to execute a step in prod")
    }

    stages {

        stage(linux_commands) {
            when {
                expression {
                    "${execute}" == true
                }
            }
            steps{
                sh '''
                echo " ${string} ${region} ${execute_in_prod} "                
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
                terraform plan --var string="${string}"
                '''
            }
        }

        stage(terraform_apply) {
            when {
                expression {
                    "${execute_in_prod}" == true
                }
            }
            steps{
                sh '''
                terraform apply --var string="${region}" --auto-approve
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
