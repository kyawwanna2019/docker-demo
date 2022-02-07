node {
    def app
    
    stage('Clone repository') {
       checkout scm
    } 

    stage("build & SonarQube analysis") {
          node {
              nodejs(nodeJSInstallationName: "nodejs"){
                //sh "npm install"
                withSonarQubeEnv('sonar') {
                    sh "npm install sonar-scanner"
                    sh "npm run sonar"
                }
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