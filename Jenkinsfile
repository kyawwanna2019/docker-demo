node {
    def app

    stage('Clone repository') {
       checkout scm
    }

    stage('Check version'){
        sh "docker --version"
        sh "node -v"
        sh "docker-compose --version"
        sh "java -version"
        sh "mvn -v"
        sh "gradle --version"
    }

    stage('SonarQube analysis') {
        withSonarQubeEnv(installationName: 'sonar', credentialsId: 'sonar-token') {
           sh 'mvn clean package sonar:sonar'
        }
    }   
}