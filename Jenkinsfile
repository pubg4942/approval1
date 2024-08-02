def linux () {
    sh '''
    set +e
    which packer
    which terraform
    '''
}

def copy (String source_path, String dest_path, String source_files) {
    sh """
    echo "$source_path" > source
    echo "$dest_path" > dest
    echo "$source_files" > file
    """

    sh '''
    final_source= 'cat source'
    final_dest= 'cat dest'
    final_file= 'cat file'

    if [ -d $final_source ]; then
        echo "source is present"
        if [ -d $final_dest ]; then
            echo "destination is present"
            echo "copy from source to destination"
            cp $final_source/* $final_dest
        else
            echo "destination is not present"
            echo "creating destination folder"
            mkdir $final_dest
            echo "copying from source to destination"
            cp $final_source/* $final_dest
        fi
    else
        echo "source is not present"
        echo "creating source folder"
        mkdir $final_source
        echo "creating files inside source folder"
        touch $final_source/$final_file
        if [ -d $final_dest ]; then
            echo "destination is present"
            echo "copy from source to destination"
            cp $final_source/* $final_dest
        else
            echo "destination is not present"
            echo "creating destination folder"
            mkdir $final_dest
            echo "copying from source to destination"
            cp $final_source/* $final_dest
        fi
    fi
    '''
}


pipeline {
    agent any

    stages {

        stage("first stage") {

            steps {
                sh '''
                ls -l
                cat project.sh
                '''
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
