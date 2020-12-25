public with sharing class LightningConnectQuickstart {
    public Boolean getCustomerIDsSet(){
        List<Account> l = [SELECT Id 
                           FROM Account 
                           WHERE Customer_Id__c = null];
        
        return (l.size() == 0);
    }
    
    public void setCustomerIDs(){
        List<Account> l = [SELECT Id FROM Account];
        for (Integer i = 0; i < l.size(); i++) {
            l[i].Customer_Id__c = String.valueOf(i + 1);
        }
        update l;
    }
}