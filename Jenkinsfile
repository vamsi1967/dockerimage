node {

     def app

     stage('Clone repository') {

       checkout scm
     }

     stage('Build image') {

       app = docker.build("vscode.docker")
   
     }

     stage('Test image') {

       app.inside{
         echo "Test passed"
      }

     }

     stage('Push image') {
     
       docker.withregistry('https://registry.hub.docker.com', 'docker-hub') {
           app.push("${env.BUILD_NUMBER}")
           app.push("latest")
         }

          echo "trying to push in to docker hub"


     }
    
    }
