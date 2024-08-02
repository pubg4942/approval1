def linux () {
    sh '''
    set +e
    which packer
    which terraform
    '''
}

def copy () {
    sh '''
    if [ -d C:/Users/maria.alex/Desktop/hardwork/source ]; then
        echo "source is present"
        if [ -d C:/Users/maria.alex/Desktop/hardwork/destination ]; then
            echo "destination is present"
            echo "copy from source to destination"
            cp C:/Users/maria.alex/Desktop/hardwork/source/* C:/Users/maria.alex/Desktop/hardwork/destination
        else
            echo "destination is not present"
            echo "creating destination folder"
            mkdir C:/Users/maria.alex/Desktop/hardwork/destination
            echo "copying from source to destination"
            cp C:/Users/maria.alex/Desktop/hardwork/source/* C:/Users/maria.alex/Desktop/hardwork/destination
        fi
    else
        echo "source is not present"
        echo "creating source folder"
        mkdir C:/Users/maria.alex/Desktop/hardwork/source
        echo "creating files inside source folder"
        touch C:/Users/maria.alex/Desktop/hardwork/source/test.txt
        touch test.txt test.tf test.sh
        if [ -d C:/Users/maria.alex/Desktop/hardwork/destination ]; then
            echo "destination is present"
            echo "copy from source to destination"
            cp C:/Users/maria.alex/Desktop/hardwork/source/* C:/Users/maria.alex/Desktop/hardwork/destination
        else
            echo "destination is not present"
            echo "creating destination folder"
            mkdir C:/Users/maria.alex/Desktop/hardwork/destination
            echo "copying from source to destination"
            cp C:/Users/maria.alex/Desktop/hardwork/source/* C:/Users/maria.alex/Desktop/hardwork/destination
        fi
    fi
    '''
}


pipeline {
    agent any

    stages {

        stage("first stage") {

            steps {
                script {
                    linux()
                    copy ()
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
