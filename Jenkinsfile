#!groovy

node {
/*
    def SF_CONSUMER_KEY=env.SF_CONSUMER_KEY
    def SF_USERNAME=env.SF_USERNAME
    def SERVER_KEY_CREDENTIALS_ID=env.SERVER_KEY_CREDENTIALS_ID
    def DEPLOYDIR='src'
    def TEST_LEVEL='RunLocalTests'
    def SF_INSTANCE_URL = env.SF_INSTANCE_URL ?: "https://test.salesforce.com"

*/
    def toolbelt = tool 'toolbelt'


    // -------------------------------------------------------------------------
    // Check out code from source control.
    // -------------------------------------------------------------------------

    stage('checkout source') {
        checkout scm
    }



    // -------------------------------------------------------------------------
    // Run all the enclosed stages with access to the Salesforce
    // JWT key credentials.
    // -------------------------------------------------------------------------

 	withEnv(["HOME=${env.WORKSPACE}"]) {	
 		stage('installing scanner'){
 		
 		    rc = command "${toolbelt}/sfdx plugins:install @salesforce/sfdx-scanner"
		    if (rc != 0) {
			error 'Scanner installation failed.'
		    }
 		}

		stage('Running pmd') {
		    //rc = command "${toolbelt}/sfdx scanner:run --target src --pmdconfig src/resources/rulesets/apex/ruleset.xml -f html -o src/results.html"
		    rc = command "${pmd}/run.sh pmd -d src -R src/resources/rulesets/apex/ruleset.xml -f xml -r src/pmd.xml"
		    if (rc != 0) {
			error 'Salesforce static analysis failed.'
		    }
		}


		// -------------------------------------------------------------------------
		// Example shows how to run a check-only deploy.
		// -------------------------------------------------------------------------

		//stage('Check Only Deploy') {
		//    rc = command "${toolbelt}/sfdx force:mdapi:deploy --checkonly --wait 10 --deploydir ${DEPLOYDIR} --targetusername UAT --testlevel ${TEST_LEVEL}"
		//    if (rc != 0) {
		//        error 'Salesforce deploy failed.'
		//    }
		//}
	    //}
	}
}

def command(script) {
    if (isUnix()) {
        return sh(returnStatus: true, script: script);
    } else {
		return bat(returnStatus: true, script: script);
    }
}

