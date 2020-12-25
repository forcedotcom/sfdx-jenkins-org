trigger callAccTrigger on Contract (after insert) {

    if(AvoidRecursion.isFirstRun()) {    
//top level Child
List<Account> childId0 =  new List<Account>();

map<ID, ID> parentid = new map<ID, ID>();
        for (Contract accID  : trigger.new){
                  parentID.put(accID.accountid, accID.ID); 
                }
      
List<Account> childId1 = new List<Account>();
childId1 = [SELECT ID FROM Account WHERE ParentID in :parentID.keyset()];  

    for (account a : ChildId1){
    childId0.add(a);
}

//level 2 child
List<Account> childId2 = new List<Account>();
childId2 = [SELECT ID FROM Account WHERE ParentID IN :ChildID1];  
for (account aa : ChildId2){
    childId0.add(aa);
}

//level 3 child
List<Account> childId3 = new List<Account>();
childId3 = [SELECT ID FROM Account WHERE ParentID IN :ChildID2];  
for (account aaa : ChildId3){
    childId0.add(aaa);
}

    
System.Debug('All Account collected:' + childId0);
      
List<Contract> insCont =  new List<Contract>();

integer i = childId0.size();
system.debug('List Size:' + i);
integer j = 0;
String accIds;
   
	for (Contract cc  : trigger.new){


	for (j=0; j<i ; j++){

       Contract c = new Contract();
       c.BillingCity = cc.BillingCity;
       c.BillingState = cc.BillingState; 
       c.startdate = cc.startdate;
       c.contractterm = cc.contractterm; 
       accIds = String.Valueof(childId0.get(j)).substring(12,30);   
       System.debug(accIds);                           
       c.accountid  = accIds;
            
        insCont.Add(c);      
          }
     
     	System.debug('***List Items:****' + insCont); 
    	System.debug('Total Acc to Insert:' + j+1);
    }
    INSERT insCont; 
  
       } 
   
}