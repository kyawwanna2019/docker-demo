node {
    def app
    
    stage('Clone repository') {
       checkout scm
    } 

    stage('SonarQube analysis') {
        def scannerHome = tool 'SonarScanner';
        withSonarQubeEnv('sonar') { // If you have configured more than one global server connection, you can specify its name
        sh "${scannerHome}/bin/sonar-scanner"
        }
    }

    stage("Quality Gate"){
          timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
    }

}