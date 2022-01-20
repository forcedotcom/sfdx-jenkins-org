@isTest
public class TestDataDupAccChk {
public static Account createOneAccount() {
	
		// Create an Account
	Account Acc = createAccount('TestAccount'); 
    //System.debug(Acc);
        return Acc;
}
// Helper methods
//
private static Account createAccount(String AccName) {
	Account Acc = new Account(Name=Accname);
   	insert Acc;
	return Acc;
}
    
}