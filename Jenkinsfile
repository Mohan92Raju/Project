pipeline {
    agent any

    triggers {
        github(branches: ["dev", "master"], // Watch both branches for changes
                traits: [ // Optional: Filter specific push events (e.g., merges)
                    [ regexp: '^refs/heads/master$', actions: 'build' ] // Build only on master merges
                ])
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
                // Docker steps for building and pushing dev image
                docker {
                    image 'nginx:latest' // Use appropriate Docker image for building
                    apiReturnStdout true
                    steps {
                        sh 'docker build -t mohandhgaja/dev:latest .' // Build Docker image
                        sh 'docker push mohandhgaja/dev:latest' // Push to Docker Hub dev repo
                    }
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
                // Docker steps for building and pushing prod image
                docker {
                    image 'nginx:latest' // Use appropriate Docker image for building
                    apiReturnStdout true
                    steps {
                        sh 'docker build -t mohandhgaja/prod:latest .' // Build Docker image
                        sh 'docker push mohandhgaja/prod:latest' // Push to Docker Hub prod repo
                    }
                }
            }
        }
    }
}
