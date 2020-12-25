@isTest
public class TestLightningConnectQuickstart {
    public static testMethod void tester() {
        List<Account> accs = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            accs.add(new Account(name = 'Test '+i));
        }
        insert accs;
        
        LightningConnectQuickstart qs = new LightningConnectQuickstart();
        
        Boolean state = qs.getCustomerIDsSet();
        
        System.assertEquals(false, state, 'IDs should not be set');
        
        qs.setCustomerIDs();

        state = qs.getCustomerIDsSet();
        
        System.assertEquals(true, state, 'IDs should be set');

		// Double check!
		accs = [SELECT Id 
                FROM Account 
                WHERE Customer_Id__c = null];
        
        System.assertEquals(0, accs.size(), 'IDs should be set');
    }
}