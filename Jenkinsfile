node {
    def app
    
    stage('Clone repository') {
       checkout scm
    } 

    stage("build & SonarQube analysis") {
          def scannerHome = tool 'SonarScanner';
          node {
              withSonarQubeEnv('sonar') {
                 //sh 'mvn clean package sonar:sonar'
                 sh "${scannerHome}/bin/sonarscan"
              }
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