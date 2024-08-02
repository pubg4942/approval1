def linux () {
    sh '''
    set +e
    which packer
    which terraform
    '''
}

def copy (String source_path, String dest_path, String source_files) {
    
    sh """
    if [ -d $source_path ]; then
        echo "source is present"
        if [ -d $dest_path ]; then
            echo "destination is present"
            echo "copy from source to destination"
            cp $source_path/* $dest_path
        else
            echo "destination is not present"
            echo "creating destination folder"
            mkdir $dest_path
            echo "copying from source to destination"
            cp $source_path/* $dest_path
        fi
    else
        echo "source is not present"
        echo "creating source folder"
        mkdir $source_path
        echo "creating files inside source folder"
        touch $source_path/$source_files
        if [ -d $dest_path ]; then
            echo "destination is present"
            echo "copy from source to destination"
            cp $source_path/* $dest_path
        else
            echo "destination is not present"
            echo "creating destination folder"
            mkdir $dest_path
            echo "copying from source to destination"
            cp $source_path/* $dest_path
        fi
    fi
    """
}


pipeline {
    agent any

    parameters {
        string(name: 'src', defaultValue: 'C:/Users/Regenerate/Desktop/hardwork/source', description: 'path of source folder')
        string(name: 'des', defaultValue: 'C:/Users/Regenerate/Desktop/hardwork/destination', description: 'path of destination folder')
        string(name: 'srcfil', defaultValue: 'trail.tf', description: 'files of source folder')
    }

    stages {

        stage("first stage") {

            steps {
                script {
                    linux()
                    copy ("${src}", "${des}", "${srcfil}")
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
