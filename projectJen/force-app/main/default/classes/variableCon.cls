public class variableCon {
    Contact contact;

    public Contact getContact() {
        if (contact == null){                      
        contact = [select LastName from Contact where 
            id = :ApexPages.currentPage().getParameters().get('id')];
        }
        return contact;
    } 
}