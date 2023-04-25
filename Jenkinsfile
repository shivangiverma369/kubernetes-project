node {
    stage('checkout code') { // for display purposes
        // Get some code from a GitHub repository
      git branch: 'main', url: 'https://github.com/shivangiverma369/kubernetes-project.git'  
      }
    stage('send dockerfile to ansible over ssh and build') {
     sshagent(['ec']) {
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@65.1.107.8'
        //   sh 'ssh -o StrictHostKeyChecking=no ubuntu@65.1.107.8 sudo usermod -aG docker jenkins'
          sh 'scp /var/lib/jenkins/workspace/kubernetes-deployment/* ubuntu@65.1.107.8:/home/ubuntu'
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@65.1.107.8 cd /home/ubuntu'
        //   sh 'sudo docker rmi -f $(sudo docker images -aq)'
          sh 'scp /var/lib/jenkins/workspace/kubernetes-deployment/* ubuntu@65.1.107.8:/home/ubuntu'

          sh 'ssh -o StrictHostKeyChecking=no ubuntu@65.1.107.8 docker image build -t $JOB_NAME:v1.$BUILD_ID .'
         
      }
    }
    stage('tag the image') {
     sshagent(['ec']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@65.1.107.8 cd /home/ubuntu'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@65.1.107.8 docker image tag $JOB_NAME:v1.$BUILD_ID vermashivangi/$JOB_NAME:latest'

    }
    
}
    stage('push the image to dockerhub') {
     sshagent(['ec']) {
    //   withCredentials([string(credentialsId: 'docker', variable: 'docker')]) {
        sh "sudo docker login -u vermashivangi -p docker369#"
        sh "ssh -o StrictHostKeyChecking=no ubuntu@65.1.107.8 docker image push vermashivangi/$JOB_NAME:latest"
    }
  }
   
    stage('deployment on kubernetes'){
        sh 'cp /var/lib/jenkins/workspace/kubernetes-deployment /home/main/Desktop/test && cd /home/main/Desktop/test'
        sh 'kubectl apply -f Deployment.yml && kubectl apply -f service.yml'

    }
  



}