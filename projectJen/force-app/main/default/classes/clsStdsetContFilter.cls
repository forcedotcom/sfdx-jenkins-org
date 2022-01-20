public class clsStdsetContFilter {
    
    public List<SelectOption> sizeOptions {get; private set;}
	public String chosenSize {get; set;}    
    public Apexpages.StandardSetController ssc {get; private set;}
    
    
    //Constructor
    
    public clsStdsetcontFilter() {
        
               sizeOptions = new List<SelectOption> {
            new SelectOption('small', 'Small'),
            new SelectOption('medium', 'Medium'),
            new SelectOption('large', 'Large')
};
			chosenSize = 'small';
        
        	ApplyFilter();
        
        
    }
      
    
    public PageReference ApplyFilter()
{
        String query = 'Select Id, Name, Rating, NumberOfEmployees from Account where ';
        if(chosenSize == 'small')
        {
        query += ' NumberOfEmployees < 100 ';
        }
        else if(chosenSize == 'medium')
        {
        query += ' NumberOfEmployees > 100 and NumberOfEmployees <= 5000 ';
        }
        else
        {
        query += ' NumberOfEmployees > 10000 ';
        }
        query += ' limit 500 ';
        ssc = new ApexPages.StandardSetController(Database.Query(query));
    
    	if(ssc.GetRecords().Size() == 0)
		{
			ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Info, 'No matching Accounts found!'));
		}
		
    	return null;
    
        
}
    

}