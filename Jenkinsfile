pipeline {
    agent {
        docker {
            image 'maven:3.8.5-openjdk-17-slim'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                echo 'Build step'
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('Test') {
            steps {
                echo 'Test step'
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver step'
            }
        }
    }
}