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

def approvalchecker (String num_of_approvals, String pr_approvers, String lvl_approvers) {
    sh """
    if [ $num_of_approvals -le 2 ]; then
        echo "need minimum 2 pr approvals, but got only $num_of_approvals"
        echo "couldnt proceed to apply"
    else
        if [ $pr_approvers == $lvl_approvers ]; then
            echo "validated 2nd level approver as - $lvl_approvers"
            echo "proceeding to apply"
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
        string(name: 'count', defaultValue: '3', description: 'no of pr approvals' )
        choice(name: 'nd', choices: ['alex', 'maria', 'k', 'f'], description: 'list of approvers')
        choice(name: 'pr', choices: ['alex', 'maria', 'k', 'f'], description: 'list of pr approvers')
    }

    stages {

        stage("first stage") {

            steps {
                script {
                    approvalchecker("${count}", "${pr}", "${nd}")
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
