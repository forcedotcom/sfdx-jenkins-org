trigger HandoffUpdate on Top_X_Designation__c (after insert,after update, after delete) {

    list<ID> HndOppAttList = new list<ID>();
    list<ID> HndOppNotAttList = new list<ID>();
    list<ID> HndOppDelete = new list<ID>();

    if(Trigger.isInsert || Trigger.isUpdate){
    for (Top_X_Designation__c tc: Trigger.new){
        if (tc.Type__c == 'Handoff' && tc.Document_Attached__c == true){
            HndOppAttList.add(tc.Lookup__c);
        	} 
        Else{
            HndOppNotAttList.add(tc.Lookup__c);
        }
        }
             
    list<Opportunity> Opp = new list<Opportunity>();
    Opp = [select ID from Opportunity where ID IN :HndOppAttList];
   if (Opp.size() != 0) {
    for (Opportunity Op : Opp) {
    Op.Handoff_Attached__c = 'Yes';
    	}
   }
    Update Opp;
    
    list<Opportunity> Opp1 = new list<Opportunity>();
    Opp1 = [select ID from Opportunity where ID IN :HndOppNotAttList];
   if (Opp1.size() != 0) {
    for (Opportunity Op : Opp1) {
    Op.Handoff_Attached__c = 'No';
    	}
   }
    Update Opp1;
        
    }  Else{
        if(Trigger.isDelete){
            System.debug('Inside Delete');
    for (Top_X_Designation__c tc: Trigger.old){
            HndOppDelete.add(tc.Lookup__c);
    }
    
   list<Opportunity> Opp2 = new list<Opportunity>();
    Opp2 = [select ID from Opportunity where ID IN :HndOppDelete];
            System.debug(Opp2);
   if (Opp2.size() != 0) {
       System.debug('Size:' + Opp2.size());
    for (Opportunity Op : Opp2) {
    Op.Handoff_Attached__c = 'No';
    	}
   }
	Update Opp2;   
}
    }
}