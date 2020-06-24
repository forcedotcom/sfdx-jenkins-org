#!groovy

node {
	

	def SF_AUTH_URL=env.SFDX_AUTH_URL
	echo SF_AUTH_URL
	def DEPLOYDIR='src'
	def TEST_LEVEL='RunLocalTests'
	def SF_INSTANCE_URL=env.SF_INSTANCE_URL ?: "https://login.salesforce.com"
	echo SF_INSTANCE_URL

	def toolbelt = tool 'toolbelt'
	echo toolbelt

	// test
	rc = command "${toolbelt}/sfdx --help"
	if (rc != 0) {
		error 'SFDX CLI Jenkins tool initalize failed.'
	}
	// File file = new File("authjenkinsci.txt")
	// file.write SF_AUTH_URL
	// echo file.text
	echo SF_AUTH_URL>>authjenkinsci.txt
}

def command(script) {
    if (isUnix()) {
        return sh(returnStatus: true, script: script);
    } else {
		return bat(returnStatus: true, script: script);
    }
}














	
