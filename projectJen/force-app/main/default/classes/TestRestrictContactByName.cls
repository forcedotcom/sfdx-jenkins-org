@isTest
public class TestRestrictContactByName {

    @isTest static void Validinsert(){
        Contact con = new Contact(FirstName='VJ', LastName='VL');
        Test.startTest();
        Database.SaveResult result = Database.insert(con, false);
        Test.stopTest();
        
        System.assert(result.isSuccess());
        
            }
    
    @isTest static void inValidinsert(){
        Contact con = new Contact(FirstName='VJ', LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(con, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
    }
}