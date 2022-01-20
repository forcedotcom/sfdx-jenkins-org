@IsTest
public class ProjectCreateTests
{
@IsTest
public static void TestControllerExtension() {
    
    Project__c project = new Project__c();
	ApexPages.StandardController sc = new ApexPages.StandardController(project);
	ProjectCreateExtension pce = new ProjectCreateExtension(sc);
    
    project.Name = 'Test Project';
	project.Budget__c = 1000;
	project.Start_Date__c = System.Today();
	Test.setCurrentPageReference(new PageReference('/apex/projectcreate1'));
 
	pce.ToPage2();
	System.Assert([select Id from Project__c].Size() == 1);
    
    
    Sprint__c sprint = new Sprint__c();
    sprint.Project__c = Project.Id;
    sprint.Name = 'TestSprint1';
    sprint.Start_Date__c = System.Today();
    pce.SaveSprint();
    pce.ToPage3();
    
    
    Story__c story= new Story__c();
    story.Sprint__c = sprint.Id;
    story.Theme__c = 'HLD';
    story.Points__c = 10;
   pce.SaveStory();
    
}
    
}