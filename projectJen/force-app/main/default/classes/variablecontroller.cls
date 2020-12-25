public class variablecontroller { 
    Contact contact; 
    public string getparam1() { 
        return ApexPages.currentPage().getParameters().get('param1'); 
    } 
    public integer getvar1() { 
        return 1; 
    } 
    public Contact getContact() {
        if (contact == null){ 
            contact = [select LastName from Contact where id = :ApexPages.currentPage().getParameters().get('id')]; 
        } 
        return contact; } 
}