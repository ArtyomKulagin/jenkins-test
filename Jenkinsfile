
pipeline {
    agent any
    tools {
        maven 'MAVEN_ENV'
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("docker build -t test/health-check:latest .")
                }
            }
        }
        stage('Deploy'){
            steps {
                sh "docker stop test/health-check | true"
                sh "docker rm test/health-check | true"
                sh "docker run --name test/health-check -d -p 8080:8080 test/health-check:latest"
            }
        }
    }
}