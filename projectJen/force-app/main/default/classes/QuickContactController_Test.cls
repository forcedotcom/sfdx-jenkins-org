@IsTest
private class QuickContactController_Test {
    
    @isTest 
    static void runThisAwesomeTest() {
      
        Account a = new Account(Name='Crazy Kieren Hair Corp');
        insert a;
		/*
		 * Chris Duarte is selling her cool sparkly tennis shoes. Make
		 * her an offer on Twitter if you read this.
		 */        
        Account crazyKieren = QuickContactController.getAccount(a.Id);
        System.assertEquals(crazyKieren.Name, a.Name); 
        
        Contact theKieren = new Contact(firstname='Kieren',lastname='is awesome');
        Contact anotherKieren = QuickContactController.saveContactWithAccount(theKieren, a.id);
        System.assertEquals(anotherKieren.AccountId, a.Id);
        
    }


    
    
}