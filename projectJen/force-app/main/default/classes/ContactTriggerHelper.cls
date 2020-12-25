public class ContactTriggerHelper {
    
    public static void updateAccountTotalContacts(List<Contact> contlistnew, List<Contact> contlistold, Boolean isdelete){
        
        Set<Id> accountIdset = new Set<Id>();
        
        if(isdelete){
            for(Contact c: contlistold){
            accountIdset.add(c.AccountId);
        	}
        } 
        else{
        for(Contact c: contlistnew){
            accountIdset.add(c.AccountId);
        	}  
        }
        	List<Account> acclist = [Select Id, Total_Contacts__c, (Select Id, Name from Contacts) from Account where ID IN : accountIdset];
        	List<Account> accountListToUpdate = new List<Account>();
        	
        for (Account a : acclist){
            
            List<Contact> contactList = a.Contacts;
            a.Total_Contacts__c = contactList.size();
            accountListToUpdate.add(a);
        }
        
        try{
            update accountListToUpdate;
        } catch (System.Exception e){
            system.debug('##Exception##' + e.getMessage());
        }
    }

}