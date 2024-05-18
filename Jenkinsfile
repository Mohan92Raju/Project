pipeline {
environment {
registry = "mohandhgaja/dev"
registryCredential = 'dockerhub_id'
dockerImage = 'capstone'
}
agent any
stages {
stage('Cloning our Git') {
steps {
git 'https://github.com/Mohan92Raju/Project.git'
}
}
stage('Building our image') {
steps{
script {
dockerfile true
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( 'capstone', registryCredential ) {
dockerImage.push()
}
}
}
}
}
}
}
