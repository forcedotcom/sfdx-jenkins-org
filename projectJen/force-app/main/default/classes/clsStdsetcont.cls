public with sharing class clsStdsetcont {
    
    
    public Apexpages.StandardSetController ssc {get; private set;}
    
    
    //Constructor
    
    public clsStdsetcont() {
        
        //instantiating class
        ssc = new Apexpages.StandardSetController(
        			[select Id, Name,  Rating,   NumberofEmployees from Account limit 500]);
    }
    
    
    public List<Account> GetAccounts() {
		
        return (List<Account>)ssc.GetRecords();
	}
    
    
    
}