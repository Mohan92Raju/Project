pipeline {
    agent { dockerfile true
            docker-compose.yml true
            }
    stages {
       stage('Build for Dev Branch (if on dev)') {
            when {
                expression { return branch == 'dev' } // Only run on dev branch
            }
            steps {
                script {
                    sh 'mvn clean install'
                }
                   steps {
                        sh 'docker build -t mohandhgaja/dev:latest .' // Build Docker image
                        sh 'docker push mohandhgaja/dev:latest' // Push to Docker Hub dev repo
                    }
            }
        }
        stage('Build and Deploy for Master Branch (if on master)') {
            when {
                expression { return branch == 'master' } // Only run on master branch
            }
            steps {
                script {
                    // Build commands for your application (identical or different)
                    sh 'mvn clean install'
                }
                    steps {
                        sh 'docker build -t mohandhgaja/prod:latest .' // Build Docker image
                        sh 'docker push mohandhgaja/prod:latest' // Push to Docker Hub prod repo
                    }
            }
        }
    }
}

