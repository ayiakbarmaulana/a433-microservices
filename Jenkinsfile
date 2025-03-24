node {
    checkout scm
    
    stage('lint-dockerfile') {
      sh 'curl -fsSL https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 -o hadolint'
      sh 'chmod +x hadolint'
      sh './hadolint Dockerfile'
    }

    stage('test-app') {
      sh 'go test -v -short --count=1 $(go list ./...)'
    }

    stage('build-app-karsajobs') {
      sh './build_push_image_karsajobs.sh'
    }
}