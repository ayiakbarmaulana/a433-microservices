pipeline {
    agent {
        docker {
            image 'golang:1.15-alpine'
        }
    }
    stages {
        stage('lint-dockerfile') {
            steps {
                sh 'curl -fsSL https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 -o hadolint'
                sh 'chmod +x hadolint'
                sh './hadolint Dockerfile'
            }
        }
        stage('test-app') {
            steps {
                sh 'go test -v -short --count=1 $(go list ./...)'
            }
        }
        stage('build-app-karsajobs') {
            steps {
                sh './build_push_image_karsajobs.sh'
            }
        }
    }
}
