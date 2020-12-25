global class CleanonSchedule implements Schedulable {
    global void execute(SchedulableContext ctx) {
    CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
    FROM CronTrigger WHERE Id = :ctx.getTriggerId()];
    System.debug(ct.CronExpression);
    System.debug(ct.TimesTriggered);

        CleanupAccounts c = new CleanupAccounts();
		Database.executeBatch(c);
	}
}