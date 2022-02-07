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

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("${imageName}")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        app.inside {
            sh "npm run test" 
            sh 'echo "Tests passed"'
        }
        /*
        sh 'echo "Tests passed"'
        sh "docker build -t ${imageName}-test -f Dockerfile.test ." 
        sh "docker run --rm ${imageName}-test"
         */
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'kwndockercredential') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}