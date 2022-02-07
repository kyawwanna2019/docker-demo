node {
    def app

    stage('Clone repository') {
       checkout scm
    }

    stage('SonarQube analysis') {
        withSonarQubeEnv(installationName: 'sonar', credentialsId: 'sonar-token') {
            sh 'mvn clean package sonar:sonar'
        }
    } 

    stage('Analyze') {
      // Run SonarQube analysis
      def scannerHome = tool 'SonarScanner';
      withSonarQubeEnv('sonar') {
        sh "${scannerHome}/bin/sonar-scanner"
      }
    }
}