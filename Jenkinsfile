pipeline {
	agent none
  stages {
  	stages {
       stage('Build') {
          steps {
            withMaven(maven: 'MAVEN_ENV') {
                sh "mvn clean build"
            }
          }
       }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t test/health-check:latest .'
      }
    }
    stage('Docker Run') {
        agent any
      steps {
        sh 'docker run -d -p 8080:8080 test/health-check:latest .'
      }
    }
  }
}