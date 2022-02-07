node {
    def app
    def imageName = 'kwn2019/docker-demo'
    def SONARQUBE_HOSTNAME = 'sonarqube' 
    def JAVA_HOME = '/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'
    def GRADLE_HOME = tool name: 'gradle-4.10.2', type: 'hudson.plugins.gradle.GradleInstallation'
    sh "${GRADLE_HOME}/bin/gradle tasks"

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
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