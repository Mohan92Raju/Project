pipeline {
  agent any

  triggers {
    githubPush {
      branchFilter {
        includes {
          // Matches both dev and main branches
          '(main|dev)'
        }
      }
    }
  }

  options {
    // Fail the pipeline if a stage fails
    failurePolicy(defaults([timeout(duration: 30, unit: 'MINUTES')]))
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: "${env.BRANCH_NAME}",
           url: 'https://github.com/Mohan92Raju/Project.git'
      }
    }
    stage('Build Docker Image (dev branch only)') {
      when {
        expression { branch == 'dev' }
      }
      steps {
          sh 'docker build -t mohandhgaja/dev-capstone .'
          sh 'docker login -u mohandhgaja -p GPLMRajuDH@7'
          sh 'docker push mohandhgaja/dev-capstone'
      }
    }
    stage('Push to Prod (dev merged to master)') {
      when {
        expression { branch == 'master' && GIT_COMMIT_MESSAGE =~ /merge dev/i }
      }
      steps {
          sh 'docker tag mohandhgaja/prod-capstone mohandhgaja/prod-capstone'
          sh 'docker login -u mohandhgaja -p GPLMRajuDH@7'
          sh 'docker push mohandhgaja/prod-capstone'
      }
    }
  }
}
