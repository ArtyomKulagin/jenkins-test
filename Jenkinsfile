
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
                    docker.build("docker build -t health-check")
                }
            }
        }
        stage('Deploy'){
            steps {
                sh "docker stop health-check | true"
                sh "docker rm health-check | true"
                sh "docker run --name health-check -d -p 8080:8080 health-check"
            }
        }
    }
}