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
                echo 'Copy file to S3'
            }
        }
        stage('Upload to S3') {
            steps {
                withAWS(region:'us-east-1',credentials:'hoabka-aws-credential') {
                    sh 'echo "Uploading content with AWS creds"'
                    s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'app.py', bucket:'jenkins-s3-bucket-wach')
                }
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver step'
            }
        }
    }
}