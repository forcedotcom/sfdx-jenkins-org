global class CleanupAccounts implements Database.Batchable<sObject> {

    global database.QueryLocator start(Database.BatchableContext bc){
        string acctxt =  '\'' + 'ScheduledBatch' + '%\'';
        string query = 'Select ID, Name, BillingCity from Account where name like ' + acctxt ;
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc , List<Account> scope) {
        
        for (Account a : scope){
            a.billingCity  = 'Charlotte';
        }
        Update scope;
    }
    
    global void finish(Database.BatchableContext BC){
        AsyncApexJob a =
                [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                TotalJobItems, CreatedBy.Email
                FROM AsyncApexJob WHERE Id =
                :BC.getJobId()];
                // Send an email to the Apex job's submitter
                // notifying of job completion.
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {a.CreatedBy.Email};
                mail.setToAddresses(toAddresses);
                mail.setSubject('Record Clean Up Status: ' + a.Status);
                mail.setPlainTextBody
                ('The batch Apex job processed ' + a.TotalJobItems +
                ' batches with '+ a.NumberOfErrors + ' failures.');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}