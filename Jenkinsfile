node {
    def app

    stage('Clone repository') {
       checkout scm
    }

    stage('SonarQube analysis') {
      steps {
        script { 
          def scannerHome = tool 'SonarScanner';
          withSonarQubeEnv('sonar') {
            sh "${scannerHome}/bin/sonarscan"
          }
        }
      }
    }  
}