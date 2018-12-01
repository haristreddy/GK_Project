function ComplieSonarQube() {
    Write-Host "Enter the function ComplieSonarQube:"
    Try {
		$sourcePaths = ""
		Set-Location "" -ErrorAction Stop
        & cmd /c "D:\SonarScanner\sonar-scanner-3.0.1.733\bin\sonar-scanner.bat" scan -e "-Dsonar.projectName=SonarQube-project-develop-Branch" "-Dsonar.projectKey=SonarQube-project-develop-Branch" "-Dsonar.projectVersion=1.0" "-Dsonar.host.url=http://10.123.66.131:9000" "-Dsonar.sourceEncoding=UTF-8" "-Dsonar.sources=$sourcePaths" "-Dsonar.exclusions=**/*.png,**/*.jpg,**/*.gif,**/*.config,**/*.xsl,**/*.css,**/pdf.js/**/*.*"
        if ($LastExitCode -ne 0) {
        throw "Failure occured on sonar-scanner.bat execution" 
        }               
    }
    Catch [Exception] {
        Write-Host "Exception occured in ComplieSonarQube:$_"
        Exit(1)
    }
    Write-Host "Leaving the function ComplieSonarQube:"       
}
ComplieSonarQube