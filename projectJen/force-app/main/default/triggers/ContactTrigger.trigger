trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    
    ContactTriggerHelper.updateAccountTotalContacts(Trigger.New, Trigger.Old, Trigger.isDelete);

}