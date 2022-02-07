node {
    def app

    stage('Clone repository') {
       checkout scm
    }

    stage('SonarQube analysis') {
        withSonarQubeEnv(installationName: 'sonar', credentialsId: 'sonar-token') {
            sh "docker --version"
            sh "node -v"
            sh "docker-compose --version"
            sh "java -version"
            sh "mvn -v"
            sh "gradle --version"
        }
    } 

    stage('Check versions') {
      // Run SonarQube analysis
      def scannerHome = tool 'SonarScanner';
      withSonarQubeEnv('sonar') {
        sh "${scannerHome}/bin/sonar-scanner"
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