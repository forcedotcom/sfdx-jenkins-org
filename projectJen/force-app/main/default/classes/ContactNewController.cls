public class ContactNewController { 
    private apexpages.StandardController controller;
    
    public contact newCont{get;set;} 
    
    Public ContactNewController(apexpages.StandardController cont) { 
        controller=cont; 
        newCont=new contact(); 
        newCont=(Contact)cont.getRecord(); 
    } 
    
    public pagereference Save() {
        newCont.leadsource='FromControllerCls'; 
        insert newCont; 
        return new apexpages.StandardController(newCont).view(); 
    } 
}