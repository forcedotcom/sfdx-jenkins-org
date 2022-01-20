public class ContactEditController { 
    private apexpages.StandardController controller; 
    public contact editContact{get;set;} 
    Public ContactEditController(apexpages.StandardController cont) { 
        
        controller=cont; 
        editContact=(Contact)cont.getRecord(); 
        editContact=[select id,name,firstname,lastname,email,phone,accountid from contact where id=:editContact.id]; 
    } 
    
    public pagereference Save() { 
        update editContact; 
        return new apexpages.StandardController(editContact).view(); 
    } 
    
    Integer count = 0; 
    public PageReference incrementCounter() { 
        count++; return null; 
    } 
    
    public pagereference phonechanged() { 
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Phone Number got changed: '+editContact.phone + ' First Name: '+ editContact.firstname ); ApexPages.addMessage(myMsg); 
        return null; 
    } 
    
    public pagereference lastnamechanged() { 
        editcontact.Firstname = editcontact.lastname;
        //ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Phone Number got changed: '+editContact.phone + ' First Name: '+ editContact.firstname ); ApexPages.addMessage(myMsg); 
        return null; 
    } 
    
    public Integer getCount() { return count; } }