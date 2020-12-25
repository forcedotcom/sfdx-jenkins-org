public with sharing class Scenario11 {
    
   Account acct;
    
   //Extension controller initializing
    public Scenario11(Apexpages.StandardController std) 
    {
        
        acct=(Account)std.getRecord();
	}
    
    
    public List<Opportunity> getchildopps() {
        
        return [Select Name, Amount, StageName, CloseDate 
					From Opportunity Where AccountId = :acct.id and (IsWon = true or IsClosed = false)];
                
    }
    
    private void createTaskOnChildOpps() {
		List<Task> tasksToInsert = new List<Task>();
			for (Opportunity opp :  [Select ISClosed, OwnerId 
					From Opportunity Where AccountId = :acct.id ]) {
                        
				if (!opp.isClosed) {
					tasksToInsert.add(
					new Task(
					WhatId = opp.Id,
					OwnerId = opp.OwnerId,
					ActivityDate = Date.today() + 3,
					Status = 'Not Started',
					Subject = 'Send follow-up email to primary contact'
)
                        );
				}	
			}
			if (tasksToInsert.size() > 0) insert tasksToInsert;
}
    
			public PageReference save() {
				if (acct.Rating == 'Hot') {
				createTaskOnChildOpps();
}
			update acct;
			return new PageReference('/' + acct.Id);
}


        
}