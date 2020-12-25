public class OlderAccountsUtility {
    
    public static void updateOlderAccounts(){
        
        List<Account> acctlist = [select id, description from account order by createddate desc];
        
        for(account acc: acctlist){
            acc.description = 'Heritage Account';
        }
        
        Update acctlist;
    }

}