pipeline {
    agent any

    tools {
      go 'go1.24.1'
    }

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

        stage('Test App') {
            steps {
                sh 'go test -v -short --count=1 $(go list ./...)'
            }
        }

        stage('Build and Push Image') {
            steps {
                // menggunakan env global variable pada jenkins dengan key github-pat
                withCredentials([string(credentialsId: 'github-pat', variable: 'GITHUB_TOKEN')]) {
                  sh '''
                  export CR_PAT=$GITHUB_TOKEN
                  ./build_push_image_karsajobs.sh
                  ''' 
                }
            }
        }
    }
}