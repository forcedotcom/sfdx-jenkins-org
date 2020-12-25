public class NewCaseListController {

    
    Public List<case> getNewCases(){
        
        String Status = 'New';
    	List<Case> results = new List<Case>();
        results = Database.query('Select ID, CaseNumber from Case where Status = \'' + status + '\'');
        return results;
    }
}