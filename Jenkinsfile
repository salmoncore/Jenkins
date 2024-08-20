pipeline {
    agent any

    stages {
        stage('Build Frontend') {
            steps {
                sh "echo Building Frontend"
                sh "cd frontend && npm install && npm run build"
            }
        }
    }
}
