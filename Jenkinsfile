pipeline {
    agent { dockerfile true }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Mohan92Raju/Project.git'
            }
        }
        stage('Build Dev Image (on dev push)') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    def imageName = "capstone:dev"
                    docker.build(imageName: imageName, dockerfile: 'Dockerfile')

                    // Assuming credentials stored as 'docker-hub-credentials'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'mohandhgaja', passwordVariable: 'GPLMRajuDH@7')]) {
                        sh "docker login -u $USERNAME -p $PASSWORD"
                        sh "docker push $imageName"
                    }
                }
            }
        }
         steps {
                script {
                    def imageName = "capstone:prod"
                    docker.build(imageName: imageName, dockerfile: 'Dockerfile')

                    // Assuming credentials stored as 'docker-hub-credentials'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'mohandhgaja', passwordVariable: 'GPLMRajuDH@7')]) {
                        sh "docker login -u $USERNAME -p $PASSWORD"
                        sh "docker push $imageName"
                }
            }
        }
    }
}

