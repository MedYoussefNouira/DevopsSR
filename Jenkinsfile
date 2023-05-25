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
                sh 'mvn -f DevopsSR/pom.xml package'
            }
        }
		

        stage('Deploy') {
            steps {
					echo 'Tht deploy part is not working';
					/* withCredentials([usernamePassword(credentialsId: 'nexus', usernameVariable: 'admin', passwordVariable: 'Alternance1997')])
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
                         ) */
            }
			
			 stage('docker-build') {
            steps {
                sh 'curl -u admin:admin -O http://localhost:8081/nexus/repository/DevopsSR/com/esprit/examen/ExamThourayaS2-0.0.1-SNAPSHOT.jar'
                script {
                            docker.withRegistry('https://index.docker.io/v1', 'dockerhub_creds') {
                            def image = docker.build('youssefnouira/DevopsSR', '-f Dockerfile --build-arg JAR_FILE=ExamThourayaS2-0.0.1-SNAPSHOT.jar .')
                            }
                }

            }
			}
            }
    }
}
