public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(integer numofContacts, string lastname){
        
        List<Contact> ContactList = new List<Contact>();
        
        for(integer i=0; i<numofContacts; i++){
            Contact cont= new Contact();
            cont.FirstName = 'Test' + i;
            cont.LastName = lastname;
            ContactList.add(cont);
        }
        for(integer j=0; j<ContactList.size(); j++){
            System.debug(ContactList.get(j));
        }
        
        return ContactList;
    }
    
}