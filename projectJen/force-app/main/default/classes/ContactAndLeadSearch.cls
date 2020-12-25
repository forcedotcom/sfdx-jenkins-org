public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads(String SearchString){
        
        String srchstring = SearchString;
        String searchquery = 'FIND {'+ srchstring +'} IN ALL FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)';
               
        List<List<sObject>> result = search.query(searchQuery);
        
        Contact[] con = (Contact[])result[0];
        Lead[] led = (Lead[])result[1];
        
      System.debug('Found the following Contacts.');
		for (Contact c : Con) { 
    		System.debug(c.FirstName + '/' +c.LastName);
}

System.debug('Found the following Leads.');
		for (Lead l : led) {
    		System.debug(l.LastName);
}
        
        return result;
        
    }

}