node {
    def app

    stage('Clone repository') {
       checkout scm
    }

    stage('SonarQube analysis') {
        withSonarQubeEnv('sonar') {
        sh 'mvn clean package sonar:sonar'
        } // submitted SonarQube taskId is automatically attached to the pipeline context
    } 

    stage('Analyze') {
      // Run SonarQube analysis
      def scannerHome = tool 'SonarScanner';
      withSonarQubeEnv('sonar') {
        sh "${scannerHome}/bin/sonar-scanner"
      }
    }
}