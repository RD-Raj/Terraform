pipeline {
    agent any
    
    tools {
             git 'Default'
          }

    parameters {
        string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
        string(name: 'version', defaultValue: '', description: 'Version variable to pass to Terraform')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }
    
  /*  environment {
        "AWS_ACCESS_KEY_ID"     = credentials('AWS_ACCESS_KEY_ID')
        "AWS_SECRET_ACCESS_KEY" = credentials('AWS_SECRET_ACCESS_KEY')
     
    }
  */
    

    
    stages {
    
        stage('AWS Cred')  {
              node {
                 withCredentials([[
                     $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: env.AWSCredID, 
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                   }
         
        }
        stage('Git Checkout') {
              steps {
                  git branch: 'main', changelog: false, credentialsId: '4013718d-c6f5-4746-b04e-40c1aacb87e1', poll: false, url: 'https://github.com/RD-Raj/Terraform.git'
                    }
             }
       /* stage('Test123') {
            steps {
                    echo "Testting"
                  }
            }  */
         stage('Terraform Init') {
            steps {
                    bat "terraform init -input=false"
                  }
         }
        stage('Plan') {
            steps {
                  bat 'terraform plan -input=false' 
                  }
            }
    
    }
}    
