public class ContactSearch {

    public static List<Contact> searchForContacts(String LstName, String PostalCode){
        
        List<Contact> Ct = new List<Contact>();
        String ln = LstName;
        String pc = PostalCode;
        Ct = [select Name from Contact where LastName = :ln and MailingPostalCode=:pc ];
        System.debug(Ct);
        return Ct;
    }
}