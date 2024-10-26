pipeline{
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
  stages{
    stage('Build') {
      steps {
	sh 'rm -rf *.var'
        sh 'jar cvf StudentSurvey.war .'     
        sh 'docker build -t abhi7422/student_survey:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW |docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
       }
    }
    stage("Push image to docker hub"){
      steps {
        sh 'docker push abhi7422/student_survey:latest'
      }
    }
        stage("deploying on kubernets")
	{
		steps{
			sh 'kubectl set image swe645hw2 container-0=abhi7422/student_survey:latest -n default'
			sh 'kubectl rollout restart deploy swe645hw2 -n default'
		}
	} 
  }
 
  post {
	  always {
			sh 'docker logout'
		}
	}    
}