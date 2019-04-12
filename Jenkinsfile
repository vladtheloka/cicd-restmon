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
		stage("Run Unit tests") {
			steps {
				runUnitTests()
			}
		} 
		stage("After tests") {
			steps {
				afterTests()
			}
		} 
	} 

}

def buildApp() {
	checkout scm
	sh("docker rm -f app")
	sh("docker build -t api .")
	sh("docker run -d --name app api")
	sh("docker ps -a")
}

def runUnitTests(){
	sh("docker exec app python -m unittest discover")
}

def afterTests(){
	sh("docker rm -f app")
}
