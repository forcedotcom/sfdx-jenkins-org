public with sharing class VJUpdateAccount {

    //variable declaration
    private ID accountID;
    transient public string accountName {get; set;}
    
    //constructor
    public VJUpdateAccount() { 
        
        Account account;
        //Get the accountID and other details from the page
        account  = [select ID, Name from Account where id = :ApexPages.currentPage().getParameters().get('id')];
        
        accountID = account.id;
        accountName = account.Name;
    }
    
    public PageReference save(){
        
        //Set the value and update
        Account myaccount  = [select Name from Account where ID = :accountID];
        myAccount.Name = accountName;
        
        Update myAccount;
        return null;     
        
    }   
}