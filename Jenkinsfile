pipeline {
    agent any
	
	tools{
		maven 'maven-4.0.0'
	}
	
    stages {
        stage('Clone') {
            steps {
                // Cloning the repository
				echo 'cloning into'
				sh 'pwd'
				sh 'rm -rf /var/jenkins_home/workspace/DevopsSR/*'
				sh "git clone 'https://MedYoussefNouira:Alternance1997@github.com/MedYoussefNouira/DevopsSR.git'"
            }
        }

        stage('Build') {
            steps {
				sh 'mvn -f DevopsSR/pom.xml clean install'
            }
        }
		
		 stage('Test') {
            steps {
                sh 'mvn test'
            }
			
        stage('Sonar Analysis') {
            steps {
                // Running Sonar analysis
                withSonarQubeEnv('sonar') {
                    sh 'mvn -f DevopsSR/pom.xml sonar:sonar -Dsonar.projectKey=Jenkins123 -Dsonar.login=sqa_4316afe53e36e4c81901b1199609994fc320982e'
                }
            }
			}
		

        stage('Deploy to Nexus') {
            steps {
                // Deploying to Nexus repository
                withMaven(maven: 'Maven') {
                    sh 'mvn deploy'
                }
            }
        }
    }
}
