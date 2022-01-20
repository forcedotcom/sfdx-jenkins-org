public class AccountHandler {

    public static account insertNewAccount(string acc){
        
        Account a = new Account();
        a.Name = acc;
        try{
            insert a;
        }catch(dmlexception e){
            System.debug('DML error occured');
            System.debug('Error Message: ' + e.getMessage() + 'Error Field Name: ' + e.getDmlFieldNames(0));
            //removing unnecessary debug statement
            //System.debug('TEST'+ a);
			return null;
	        }
        
        return a;
    }
}