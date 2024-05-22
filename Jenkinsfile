pipeline {   
  agent{      
    node { label 'slavefordocker'}     
  }  
  environment {     
    DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
  }    
  stages {         
    stage("Git Checkout"){           
      steps{
	git 'https://github.com/Mohan92Raju/Project.git'
	echo 'Git Checkout Completed'            
      }        
    }
    stage('Build Docker Image') {         
      steps{                
	sh 'sudo docker build -t mohandhgaja/dev:$BUILD_NUMBER .'           
        echo 'Build Image Completed'                
      }           
    }
    stage('Login to Docker Hub') {         
      steps{                            
	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
	echo 'Login Completed'                
      }           
    }               
    stage('Push Image to Docker Hub') {         
      steps{                            
	sh 'sudo docker push mohandhgaja/dev:$BUILD_NUMBER'            
	echo 'Push Image Completed'       
      }           
    }      
  } //stages 
  post{
    always {  
      sh 'docker logout'           
    }      
  }  
} //pipeline
