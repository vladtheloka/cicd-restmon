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
	sh("docker build -t api .")
	sh("docker run -d --name app api")
	sh("docker ps -a")
}
