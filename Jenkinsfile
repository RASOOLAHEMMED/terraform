pipeline {
  agent {
    node { label 'workstation'  }
  }

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Pick a terraform Action')
    }

  stages {

    stage('Terraform INIT') {
      steps {
        sh 'cd  roboshop-shell-scripting ; terraform init'
      }
    }

    stage('Terraform apply') {

        when {
            environment name: 'ACTION', value: 'apply'
        }
      steps {
        sh '''
          cd roboshop-shell-scripting
          terraform apply -auto-approve
        '''
      }
    }

     stage('Terraform destroy') {
        when {
                    environment name: 'ACTION', value: 'destroy'
                }

          steps {
            sh '''
              cd roboshop-shell-scripting
              terraform destroy -auto-approve
            '''
          }
        }

  }
}