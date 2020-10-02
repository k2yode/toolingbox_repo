pipeline {
    agent any
    stages {
        stage ('apply') {
            environment {
                AWS_ACCESS_KEY = credentials ('ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials ('SECRET_KEY')
            }
        steps {
            sh 'terraform init'
            sh 'terraform apply -auto-approve'
        }
        }
        
    }
}