public class AccountSearchExtension {
    
    
        public List<Account> accounts  {get; set;}
        public integer count {get; set;}
        public List<Contact> contacts  {get; set;}
        public string ID {get; set;}
        public String searchString { get; set;}
        public Apexpages.StandardController Controller;
    
        
  
    //Constructor
    public AccountSearchExtension (ApexPages.StandardController stdController){
        Controller = stdController;
        count=NULL;
            }
        
    public PageReference getAccounts(){
        accounts = [select ID, Name, Phone, BillingCity from Account where name like : searchString +'%'];     
        count  = accounts.size();
        //Clear contacts during next search
        contacts = NULL;
        return null;
    }
    
        public PageReference gotoAccount(){
            	return new PageReference('/' + ID);
    }
    
      public PageReference getContacts(){
          contacts = [select email, phone from contact where contact.Account.ID = : ID];
          return null;
    }
    

}