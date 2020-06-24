#!groovy

node {

	def SF_AUTH_URL=env.SFDX_AUTH_URL
	echo SF_AUTH_URL
	def DEPLOYDIR='force-app/'
	def TEST_LEVEL='RunLocalTests'
	def SF_INSTANCE_URL=env.SF_INSTANCE_URL ?: "https://login.salesforce.com"
	echo SF_INSTANCE_URL

	def toolbelt = tool 'toolbelt'
	echo toolbelt

	rc = command "${toolbelt}/sfdx --help"
	if (rc != 0) {
		error 'SFDX CLI Jenkins tool initalize failed.'
	}

	writeFile file: 'authjenkinsci.txt', text: SF_AUTH_URL
	sh 'ls -l authjenkinsci.txt'
	sh 'cat authjenkinsci.txt'

	// auth
	rc2 = command "${toolbelt}/sfdx force:auth:sfdxurl:store -f authjenkinsci.txt -a targetEnvironment"
	if (rc2 != 0) {
		error 'SFDX CLI Authorization to target env has failed.'
	}
	// run tests
	rc3 = command "${toolbelt}/sfdx force:apex:test:run -u targetEnvironment --wait 10"
	if (rc3 != 0) {
		error 'There was an issue running apex tests. Check ORG for details'
	}
	// deploy full build
	rc4 = command "${toolbelt}/sfdx force:source:deploy --wait 10 --sourcepath ${DEPLOYDIR} --testlevel ${TEST_LEVEL} -u targetEnvironment"
	if (rc4 != 0) {
		error 'There was an issue deploying. Check ORG deployment status page for details'
	}
}

def command(script) {
    if (isUnix()) {
        return sh(returnStatus: true, script: script);
    } else {
		return bat(returnStatus: true, script: script);
    }
}














	
