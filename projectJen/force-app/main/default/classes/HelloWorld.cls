public class HelloWorld {
    
    public static void sayYou() {
System.debug( 'You' );
	}
    
    public void sayMe() {
System.debug( 'Me' );
	}  
    
    public void mapp(){
        
//Map Can hold data with Key
//If Duplicate keys are specified, data is just overwritten
		System.debug('**Start of Map**');
        Map<integer, String> mapEmp = New Map<integer, string>();
        mapEmp.Put(1, 'Emp1');
        mapEmp.Put(2, 'Emp2');
        mapEmp.Put(3, 'Emp3');
        mapEmp.put(2, 'Empx');
        System.debug(mapEmp);
        //Get value specific to a Key
        System.debug(mapEmp.get(3));
        //Get all the available Keys
        System.debug(mapEmp.keySet());
        //Get all the available values
        System.debug(mapEmp.Values());
        //Remove a Key and its values
        string remObjKey = mapEmp.remove(2);
        System.debug(mapEmp.Values());

        //Map with SObject.Create a list object and then use it in the map
        List<Account> LstObjAcc = [Select Name, BillingCity from Account];
        Map<ID,Account> mapObjAcc = new Map<ID,Account>(LstObjAcc);
        //System.debug(mapObjAcc);
        //System.debug(mapObjAcc.get('001o000000BbfeWAAR'));
        //Find Size of the Map
        Integer NumofRec = mapObjAcc.Size();
        System.debug('Map Size: '+ NumofRec );
        System.debug(mapObjAcc);
        //Compare Maps
        System.debug(mapEmp.equals(mapObjAcc));
        System.debug('**End of Map**');                
    }

    
    
    public Void listt(){
        
        //List Can hold multi-dimensional data
        //
		System.debug('**Start of List**');
        List<Account> LstAccObj = New List<Account>();
        LstAccObj = [SELECT ID, Name, BillingState, Phone FROM Account WHERE NOT NAME LIKE '%scheduled%'];

        /*System.assertEquals(
           LstAccObj.getSObjectType(), 
           Account.sObjectType);*/

        System.debug(LstAccObj.getSObjectType());
        
        //System.assertEquals('VJ','vijay');
        
        //Find Size of the List
        Integer NumofRec = LstAccObj.Size();
        System.debug('Number of Accounts Fetched: '+ NumofRec );
          
        //Clear the List
        /*System.debug('Clearing List');
        LstAccObj.Clear();
        NumofRec = LstAccObj.Size();   
        System.debug('Number of Accounts Fetched after clearing: '+ NumofRec );*/
        
        IF(LstAccObj.ISEMPTY()) {
            System.debug('Empty');
        }
        Else{
            System.debug('Not Empty');
        }
        
        //Clone/Deep Clone a List
        /*Clone  -  Copies the entire list, ID values are retained
        DeepClone -  Copies the entire list, ID valus are NOT RETAINED (but can be controlled thru arguments,Default - False)
        Boolean opt_preserve_id, Boolean opt_preserve_readonly_timestamps, Boolean opt_preserve_autonumber)*/
        
        List<Account> LstAccObjClone = LstAccObj.DeepClone(False);
        
        //Compare Lists
        Boolean TestForEquality = LstAccObj.equals(LstAccObjClone);
        System.debug('Test for Equality: ' + TestForEquality);
        
        for(account a: LstAccObjClone){
            
            System.debug ('ID: '+ a.ID + '/Account Name: ' + a.Name + '/BillingState: ' 
                          + a.BillingState + '/Phone: ' + a.Phone);
        }
        
        List<String> LstStrObj = New List<String> ();
        LstStrObj.add('VJ');
        LstStrObj.add('VP');
        LstStrObj.add('VK');
        
        //String Name = LstStrObj.Get(0); -- Get Item based on position
        //System.debug('Name: ' + Name);
        
        for (String a : LstStrObj){
            System.debug('Name: '+ a);
        }
        System.debug('**End of List**'); 
    }
}