def linuxcommands () {
    sh'''
    pwd
    ls -l
    whoami
    uname -a
    '''
}

pipeline {
    agent any

    options {
      ansiColor('xterm')
    }

    environment {
        env1 = "dai"
        env2 = "kena"
        env3 = "punda"
        env4 = "ootha"
    }

    parameters {
        string(name: "string", defaultValue: "helloworld", description: "enter string input")
        choice(name: "region", choices: ["us-west-2", "us-east-1", "ap-sout-1", "eu-entral-1"], description: "select region")
        booleanParam(name: "execute_in_prod", defaultValue: true, description: "whether to execute a step in prod")
    }

    stages {

        stage(linux_commands) {
            steps {
                linuxcommands()
            }
        }

        stage(initialization) {
            steps {
                sh '''
                terraform init
                terraform fmt
                terraform validate
                terraform plan --var string="${env4} ${env3}"
                '''
            }
        }

        stage(terraform_apply) {
            steps{
                withCredentials([usernamePassword(credentialsId: 'username_password', usernameVariable: 'username', passwordVariable: 'password')]) 
                {
                    sh '''
                    echo "${username}"
                    echo "${password}"
                    terraform apply --var string="${env2} ${env3}" --auto-approve
                    '''
                }
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
