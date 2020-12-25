public class VJAccController {

    List<Account>  Accounts;
    
    public List<Account> getAccounts() {
        
        if(Accounts ==  null) {
            Accounts = [Select Name, BillingCity from Account];
            
        }
        return Accounts;
    }
    
    
}