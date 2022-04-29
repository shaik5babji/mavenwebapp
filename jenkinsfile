pipeline{
    agent{ label 'DEV'}
    tools{
        jdk 'java'
        git 'Default'
        maven 'maven'
        
    }
    stages{
        stage('Build started') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        
        stage('cloning our git') {
            steps{
            git 'https://github.com/shaik5babji/mavenwebapp.git'
            
            }
        }
        stage('list git') {
            steps {
            sh 'ls -lart'
            sh 'echo $VER'
            }
        }
        stage('maven') {
            steps{
                sh 'mvn clean package'
            }
        }
        /*stage('deploy to nexus') {
          steps {
            nexusArtifactUploader artifacts: [[artifactId: 'mvnwebapp',
            classifier: '', file: 'target/mvnwebapp.war', 
            type: 'war']
            ], 
            credentialsId: 'nexuspwd', groupId: 'com.mvn.webapp', 
            nexusUrl: '18.217.245.10:8081', 
            nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots/', 
            version: '1.0-SNAPSHOT'
          }
        }*/
        stage('pwd') {
          steps{
            sh 'pwd'
          }
        }
        stage('build dockerfile') {
          steps{
            sh 'sudo docker build -t babji/mywebapp:1.10 .'
          }
        }
        stage(' docker push') {
          steps{
            withCredentials([string(credentialsId: 'babji', variable: '')]) {
            sh "sudo docker login -u babji -p Pulsar@5182"
            }
            sh 'sudo docker push babji/mywebapp:1.10'
          }
        }
        stage('deploy to k8s') {
            steps{
              sshagent(['k8spwd']) {
                sh "scp -o StrictHostKeyChecking=no kubernatesfile.yaml ec2-user@13.58.55.175:/home/ec2-user/"
                sh "ssh ec2-user@13.58.55.175 kubectl apply -f ."
              }
            }
        }
    }
}
