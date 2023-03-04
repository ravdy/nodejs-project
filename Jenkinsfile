def registry = 'https://valaxy02.jfrog.io'
def imageName = 'valaxy02.jfrog.io/nodejs-docker/demo-nodejs'
def version   = '2.0.2'
pipeline{
    agent {
        node {
            label "valaxy"
        }
    }
    tools {nodejs 'nodejs-16'}

    stages {
       stage('checkoutcode'){
            steps {
	            git 'https://github.com/wardviaene/docker-demo.git'
	       }
	    }
        stage('build') {
            steps{
                echo "------------ build started ---------"
               	sh "npm install"
                echo "------------ build completed ---------"
        }
      }

        stage('Unit Test') {
            steps {
                echo '<--------------- Unit Testing started  --------------->'
                sh 'npm test'
                echo '<------------- Unit Testing stopped  --------------->'
            }
        }

stage(" Docker Build ") {
      steps {
        script {
           echo '<--------------- Docker Build Started --------------->'
           app = docker.build(imageName+":"+version)
           echo '<--------------- Docker Build Ends --------------->'
        }
      }
    }

    stage (" Docker Publish "){
        steps {
            script {
               echo '<--------------- Docker Publish Started --------------->'  
                docker.withRegistry(registry, 'jfrog-access'){
                    app.push()
                }    
               echo '<--------------- Docker Publish Ended --------------->'  
            }
        }
    }  
    }
    }
