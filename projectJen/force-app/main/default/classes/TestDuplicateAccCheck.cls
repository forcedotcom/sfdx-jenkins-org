@isTest
private class TestDuplicateAccCheck {

static testmethod void TestInsertAccount() {
 	
//Insert one Account 	
//    
	Test.startTest();
    //Database.SaveResult result = Database.insert(Acc,true);
    Account Acc = TestDataDupAccChk.createoneAccount();
    System.Debug('First Block1:' + Acc);
    Test.stopTest();  
    }
        
static testmethod void TestBulkInsertAccount() {
//Insert Multiple Accounts
//    	  
    List<Account> AccList = new List<Account>();
    AccList.add(TestDataDupAccChk.createoneAccount());
    AccList.add(TestDataDupAccChk.createoneAccount());
    
    System.debug(AccList);
        
    Test.startTest();
    	Database.SaveResult[] results = Database.insert(AccList, false);
    Test.stopTest(); 
    
                 
	}    
}