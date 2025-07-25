pipeline {
  agent any

  stages {
    stage('Clone Repository') {
      steps {
        echo "Cloning repository..."
        git branch: 'main', url: 'https://github.com/akashgupta2233/web-dev-tools.git'
      }
    }

    stage('Simulate Build') {
      steps {
        echo "Build stage skipped (Docker not installed in Jenkins container)."
        echo "Pretending build succeeded."
      }
    }

    stage('Simulate Push to Docker Hub') {
      steps {
        echo "Skipping Docker push. (Docker not available)"
      }
    }

    stage('Simulate Deploy to Kubernetes') {
      steps {
        echo "Skipping deployment to Kubernetes. (kubectl not available)"
      }
    }
  }
}
