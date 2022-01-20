public with sharing class EmailManager {
    
    public static void sendMail(String address, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setSenderDisplayName('TrailHead');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}