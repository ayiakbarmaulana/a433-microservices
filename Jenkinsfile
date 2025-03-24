pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Lint Dockerfile') {
            steps {
                sh 'curl -fsSL https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 -o hadolint'
                sh 'chmod +x hadolint'
                sh './hadolint Dockerfile'
            }
        }

        stage('Build and Push Image') {
            steps {
                withCredentials([string(credentialsId: 'github-pat', variable: 'GITHUB_TOKEN')]) {
                  sh '''
                  export CR_PAT=$GITHUB_TOKEN
                  ./build_push_image_karsajobs_ui.sh
                  ''' 
                }
            }
        }
    }
}