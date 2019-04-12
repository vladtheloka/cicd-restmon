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
	checkout scm
	def appImage = docker.build("cicd-restmon/restmon/api:${BUILD_NUMBER}")
}
