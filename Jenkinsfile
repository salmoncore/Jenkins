pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "echo Building - Stage 1"
            }
        }

        stage('Test') {
            steps {
                sh "echo Testing - Stage 2"
            }
        }

        stage('TestGitWebhook') {
            steps {
                sh "echo Git - Stage 2.5"
            }
        }

        stage('Deploy') {
            steps {
                sh "echo Deployment - Stage 3"
            }
        }
    }
}
