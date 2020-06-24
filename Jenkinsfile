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
	{$toolbelt};
}

def command(script) {
    if (isUnix()) {
        return sh(returnStatus: true, script: script);
    } else {
		return bat(returnStatus: true, script: script);
    }
}














	
