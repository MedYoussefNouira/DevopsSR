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
                sh 'mvn -f DevopsSR/pom.xml  test'
            }
		}
		
        stage('Sonar Analysis') {
            steps {
                // Running Sonar analysis
                withSonarQubeEnv('sonar') {
                    sh 'mvn -f DevopsSR/pom.xml sonar:sonar -Dsonar.projectKey=Jenkins123 -Dsonar.login=sqa_4316afe53e36e4c81901b1199609994fc320982e'
                }
            }
			}
			
			    stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
		

               /* stage('Deploy') {
            steps {
					withCredentials([usernamePassword(credentialsId: 'nexus', usernameVariable: 'admin', passwordVariable: 'Alternance1997')])
                        nexusArtifactUploader(
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            nexusUrl: 'localhost:8081/nexus',
                            groupId: 'com.esprit.examen',
                            version: '1.0',
                            repository: 'DevopsSR',
                            artifacts: [
                                [artifactId: 'ExamThourayaS2-0.0.1-SNAPSHOT',
                                 classifier: '',
                                 file: 'target/ExamThourayaS2-0.0.1-SNAPSHOT.jar',
                                 type: 'jar']
                            ]
                         )
            }
			*/
            }
    }
}
