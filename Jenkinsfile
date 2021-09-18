pipeline {
  agent any
  tools{
    terraform 'terraform2'
  }
    parameters{
      choice(choices: ['apply', 'destroy'], description: 'for terraform apply and destroy', name: 'terraform_state')
    }
  stages {
    stage('Git checkout'){
      steps{
        git 'https://github.com/nduka145/Terraform.git'
      }
    }
    stage('Terraform init'){
      steps{
        sh 'terraform init'
      }
    }
    stage('Terraform plan'){
      steps{
        sh 'terraform plan'
      }
    }
    stage('Terraform apply'){
      steps{
        sh 'terraform "${terraform_state}" --auto-approve'
      }
    }
  }
}
