pipeline {
    agent any

    stages {
        
       
        stage('Docker Build') {
            steps {
                sh "docker build . -t sabair0509/hiring-app:$BUILD_NUMBER"
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                    sh "docker login -u sabair0509 -p ${hubPwd}"
                    sh "docker push sabair0509/hiring-app:$BUILD_NUMBER"
                }
            }
        }
            }
        }

    }
}
