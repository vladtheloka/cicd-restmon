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
		stage("Deploy to Docker Hub") {
			steps {
				deployToDokerHub()
			}
		} 
		stage("Deploy to Heroku"){
			steps{
				deployToHeroku()
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

def deployToDokerHub(){
	sh("docker login -u $DOCKER_USER -p $DOCKER_PASS")
	sh("docker build -f Dockerfile -t $DOCKER_REPO:latest .")
	sh("docker push $DOCKER_REPO:latest")
}

def deployToHeroku(){
	sh .travis/deploy_heroku.sh
}
