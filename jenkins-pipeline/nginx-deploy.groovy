pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
          sh 'sudo docker build --tag mynginx:1.0 .'        
      }
    }  
    stage('Deploy') {
      steps {
          sh 'sudo docker run --publish 80:80 --detach --name nginx mynginx:1.0'
      }
    }
    stage('Test') {
        steps {
            sh '''
               if [ $(curl -s -o /dev/null -I -w "%{http_code}" http://localhost:80/) -eq 200 ]; then
                    echo -e "NGinx is Running!"
                    exit 0
               else
                    exit 1
               fi
            '''             
        }
    }
  }
}