#!groovy
//@Library("Jenkins_Library@2.147") _
pipeline {
   agent{
	   node {
	   label 'master'
	   	customWorkspace "F://Jenkins//${env.JOB_NAME}".replace('%2F', '_')
	   
   }
   
   }
			
		
parameters{
		
	    string(	defaultValue: "12.1.0", 
				description: 'Package version', 
				name: 'COMPONENTVERSION' )
		/*string( defaultValue: '25689',
				description: 'The GIT PROJECT ID',
				name: 'GIT_PROJECT_ID' )   */             

		string( defaultValue: "haristreddy@gmail.com",
				description: 'E-mail Addresses for users who need failed or succesful build e-mails',
				name: 'EMAIL_LIST')

		booleanParam( defaultValue: false,
		        description: 'True false testing mechanism',
				name: 'FULL_BUILD')

	}

	environment {
		ComponentVersion = "${params.COMPONENTVERSION}.${env.BUILD_NUMBER}"	
	}

  /*  triggers {
        githubPush
    } */

    stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}

	stage('Build') {
			steps {
			  println "Starting build"
				dir("${env.WORKSPACE}\\build") {
					//bat "\"${tool 'msbuild'}\"  project.XML"
					bat "C://Windows//Microsoft.NET//Framework//v4.0.30319//MSBuild.exe"  "project.XML"	
								
			}

				/*dir("${env.WORKSPACE}") {
					echo "Creating a Build status file"
                    writeFile file: "output/MR_Title.txt", text: "BUILD STATUS:"
				} */
			}
		} 
	/*	stage('Package Full Build') {
			steps {
				dir("${env.WORKSPACE}\\build") {
                    bat "\"${tool 'msbuild'}\"  %PROJECT_NAME%.XML /t:Publish /p:version=${env.ComponentVersion} "
				}
			}
		}*/

	} 
	/* post {
       always {
        /// clean up the file
            dir("${env.WORKSPACE}\\output") {
                deleteDir()
            }
        }  
		failure {
			updateGitlabCommitStatus name: 'build', state: 'failed'
			// Only send e-mail errors when it is the master branch
			script {
				
					emailext (
						to: "${params.EMAIL_LIST}", 
						subject: "Build ${env.BUILD_NUMBER} - FAILED (${env.JOB_NAME})" 
					)
					
			}  			          
		}
		success {
			updateGitlabCommitStatus name: 'build', state: 'success'

			script {
				emailext (
						to: "${params.EMAIL_LIST}", 
						subject: "Build ${env.BUILD_NUMBER} - SUCCESS (${env.JOB_NAME})" 
					)
				
			}
		}
  	} */

	}