#!groovy

node {

    def SF_CONSUMER_KEY='3MVG9szVa2RxsqBb2BVbPH5qUdCLSsGCTFgJB8EcU0xLXgX8LQylKcc59g66aQNjABHD9BKWE0FsZnkvx2l9d'              //env.SF_CONSUMER_KEY
    def SF_USERNAME='edw.sfdc@gmail.com'                       //env.SF_USERNAME
    def SERVER_KEY_CREDENTIALS_ID='5e1d7174-4aa0-4e05-838e-bfa37908534c'           //env.SERVER_KEY_CREDENTIALS_ID
    def DEPLOYDIR='src'
    def TEST_LEVEL='RunLocalTests'


    def toolbelt = tool 'toolbelt'
	def sfdxexe = 'C:\\Program Files\\Salesforce CLI\\bin\\sfdx'


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

    withCredentials([file(credentialsId: SERVER_KEY_CREDENTIALS_ID, variable: 'server_key_file')]) {
        // -------------------------------------------------------------------------
        // Authenticate to Salesforce using the server key.
        // -------------------------------------------------------------------------

        stage('Authorize to Salesforce') {
            
			rc = bat returnStatus: true, script: "\"${sfdxexe}\" force:auth:jwt:grant --instanceurl https://login.salesforce.com --clientid ${SF_CONSUMER_KEY} --jwtkeyfile ${server_key_file} --username ${SF_USERNAME} --setalias UAT"
            if (rc != 0) {
                error 'Salesforce org authorization failed.'
            }
        }


        // -------------------------------------------------------------------------
        // Deploy metadata and execute unit tests.
        // -------------------------------------------------------------------------

        stage('Deploy and Run Tests') {
            rc = bat returnStatus: true, script: "\"${sfdxexe}\" force:mdapi:deploy --wait 10 --deploydir ${DEPLOYDIR} --targetusername UAT --testlevel ${TEST_LEVEL}"
            if (rc != 0) {
                error 'Salesforce deploy and test run failed.'
            }
        }


        // -------------------------------------------------------------------------
        // Example shows how to run a check-only deploy.
        // -------------------------------------------------------------------------

        //stage('Check Only Deploy') {
        //    rc = bat returnStatus: true, script: "\"${sfdxexe}\" force:mdapi:deploy --checkonly --wait 10 --deploydir ${DEPLOYDIR} --targetusername UAT --testlevel ${TEST_LEVEL}"
        //    if (rc != 0) {
        //        error 'Salesforce deploy failed.'
        //    }
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
