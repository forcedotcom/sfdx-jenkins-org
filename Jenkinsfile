#!groovy

import groovy.json.JsonSlurperClassic

node {

    def SF_CONSUMER_KEY=env.SF_CONSUMER_KEY
    def SF_USERNAME=env.SF_USERNAME
    def SERVER_KEY_CREDENTALS_ID=env.SERVER_KEY_CREDENTALS_ID
    def DEPLOYDIR=src
    def TEST_LEVEL=RunLocalTests


    def toolbelt = tool 'toolbelt'


    // -------------------------------------------------------------------------
    // Checkout code from source control.
    // -------------------------------------------------------------------------

    stage('checkout source') {
        checkout scm
    }


    // -------------------------------------------------------------------------
    // Run all of the enclosed stages with access to the Salesforce
    // JWT key credentials.
    // -------------------------------------------------------------------------

    withCredentials([file(credentialsId: SERVER_KEY_CREDENTALS_ID, variable: 'server_key_file')]) {
        // -------------------------------------------------------------------------
        // Authenticate to Salesforce using server key.
        // -------------------------------------------------------------------------

        stage('Authorize to Salesforce') {
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:auth:jwt:grant --instanceurl https://test.salesforce.com --clientid ${SF_CONSUMER_KEY} --jwtkeyfile ${server_key_file} --username ${SF_USERNAME} --setalias UAT"
            if (rc != 0) {
                error 'Salesforce org authorization failed.'
            }
        }


        // -------------------------------------------------------------------------
        // Deploy metadata and execute unit tests.
        // -------------------------------------------------------------------------

        stage('Deploy and Run Tests') {
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:mdapi:deploy --wait 10 --deploydir ${DEPLOYDIR} --targetusername UAT --testlevel ${TESTLEVEL}"
            if (rc != 0) {
                error 'Salesforce deploy and test run failed.'
            }
        }


        // -------------------------------------------------------------------------
        // Example shows how to run a check only deploy.
        // -------------------------------------------------------------------------

        //stage('Check Only Deploy') {
        //    rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:mdapi:deploy --checkonly --wait 10 --deploydir ${DEPLOYDIR} --targetusername UAT --testlevel ${TESTLEVEL}"
        //    if (rc != 0) {
        //        error 'Salesforce deploy failed.'
        //    }
        //}
    }
}
