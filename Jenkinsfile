pipeline {
	agent none
  stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:3.5.0'
        }
      }
      steps {
      	sh 'mvn clean install'
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