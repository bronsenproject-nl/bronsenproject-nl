pipeline {
  agent any
  triggers {
    cron '@daily'
  }
  stages {
    stage('Preparation') {
      steps {
        // Backup has started
        notifyStarted()
        // Clean workspace
        step([$class: 'WsCleanup', cleanWhenFailure: false])
        // Get code from github.com
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-git', url: 'http://jenkins@github.com/bronsenproject-nl/bronsenproject-nl.git']]]
      }
    }
    stage('Backup bronsenproject.nl') {
      steps {
        echo "Backup bronsenproject.nl"
        sh "./bronsenproject.nl-site/backup/backup_bronsenproject-site.sh"
      }
    }
    stage('Backup boekhouding.bronsenproject.nl') {
      steps {
        echo "Backup boekhouding.bronsenproject.nl"
        sh "./bronsenproject.nl-boekhouding/backup/backup_bronsenproject-boekhouding.sh"
      }
    }
    stage('Backup webmail.bronsenproject.nl') {
      steps {
        echo "Backup webmail.bronsenproject.nl"
        sh "./bronsenproject.nl-webmail/backup/backup_bronsenproject-webmail.sh"
      }
    }
    stage('Cleanup old backups') {
      steps {
        echo "Cleanup old backups"
        sh "./utils/move_old_backups.sh"
      }
    }
  }
  post {
    success {
      notifySuccess()
    }
    failure {
      notifyFailed()
    }
  }
}

def notifyStarted() {
  slackSend (channel: '#bronsenproject-nl', color: '#FFFF00', message: "STARTED: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
def notifySuccess() {
  slackSend (channel: '#bronsenproject-nl', color: '#00FF00', message: "SUCCESSFUL: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
def notifyFailed() {
  slackSend (channel: '#bronsenproject-nl', color: '#FF0000', message: "FAILED: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
