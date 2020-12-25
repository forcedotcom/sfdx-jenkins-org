public class ProjectCreateExtension {
    
    	private ApexPages.StandardController sc;
	    public Sprint__c sprint {get; set;}
    	public List<Sprint__c> Sprints {get; set;}
    	public String selectedSprint {get; set;}
    	public Story__c story {get; set;}
    	public List<Story__c> stories {get; set;}
    	private Project__c project = null;
		
    	public ProjectCreateExtension(ApexPages.StandardController standardController) {
            
            // store a reference to the standard controller
            sc = standardController;
            // create a new sprint instance to collect user input
			sprint = new Sprint__c();
            // create a new list to store the sprints added by the user
			sprints = new List<Sprint__c>();
            // create a new sprint instance to collect user input
			story = new Story__c();
            // create a new list to store the sprints added by the user
			stories = new List<Story__c>();
            
                        
		}

    
    	public PageReference ToPage1() {
			return Page.ProjectCreate1;
		}
    
    
    	public PageReference ToPage2() {
			if(ApexPages.CurrentPage().GetURL().StartsWith('/apex/projectcreate1'))
				{
					sc.Save();
                    project = (Project__c)sc.GetRecord();
                    sprints = [select Id, Name, Start_Date__c from Sprint__c where Project__c = : project.Id];
				}
			return Page.ProjectCreate2;
		}
    
    
    	public PageReference ToPage3() {
            
            stories = [SELECT Id, Theme__c, Points__c, Story__c FROM Story__c where Sprint__c = : selectedSprint];
			return Page.ProjectCreate3;
		}
    
    
    	public PageReference SaveSprint() {
            Project__c project = (Project__c)sc.GetRecord();
            sprint.Project__c = project.Id;
            insert sprint;
            
            sprints.Add(sprint);
            sprint = new Sprint__c();
            return null;
		}
    
    
    	public PageReference SaveStory() {
        story.Sprint__c = selectedSprint;
        insert story;
            
        stories.Add(story);
        story = new Story__c();
        return null;
}
    
}