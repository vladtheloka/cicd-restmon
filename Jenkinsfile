#!/usr/bin/groovy

pipeline {
	agent any

	options {
		disableConcurrentBuilds()
	}

	stages {
		stage("Build") {
			steps {
				buildApp()
			}
		} 
	} 

}

def buildApp() {
        withEnv(['HOME='+pwd()])
        {
        	def appImage = docker.build("cicd-restmon/myapp:${BUILD_NUMBER}")
        }
}
