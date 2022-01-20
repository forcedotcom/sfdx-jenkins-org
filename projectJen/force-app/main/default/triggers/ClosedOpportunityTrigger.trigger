trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<task> tasklist = new List<task>();
    
    for(Opportunity op : Trigger.New){
        
        if (op.isClosed == true & op.IsWon == true){
            tasklist.add(new task(ownerid=op.OwnerId, Subject = 'Follow Up Test Task', whatid=op.ID));
        }
    }
    
    if(tasklist.size()>0){
        insert tasklist;
    }
    
}