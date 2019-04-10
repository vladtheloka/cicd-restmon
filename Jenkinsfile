node {
  def appName = 'cicd-restmon/restmon/api'
  def imageTag = "vladtheloka/${appName}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"

  checkout scm

  stage 'Build image'
  sh("docker build -t ${imageTag} .")
  }