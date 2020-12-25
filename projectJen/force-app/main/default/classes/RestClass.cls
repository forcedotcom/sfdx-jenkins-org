@RestResource(UrlMapping='/Account/*')

global with sharing class RestClass {

    @HttpGet
    global static Account doGet() {
            
        RestRequest req = RestContext.request;
        RestResponse res= RestContext.response;
        String AccountID  = req.requestURI.Substring(req.requestURI.lastindexOf('/')+1);
        Account result = [select name from account where ID = :AccountID];
        return result;        
    }
    
    
    @HttpDelete
    global static Account doDelete() {
            
        RestRequest req = RestContext.request;
        RestResponse res= RestContext.response;
        String AccName  = req.requestURI.Substring(req.requestURI.lastindexOf('/')+1);
        Account result = [select name from account where Name = :AccName];
        DELETE result;
        return result;        
    }
    
    @HttpPost
    global static Account doPost(string name, string billingcity, string phone) {
            
        Account account = new Account();
        account.name = name;
        account.BillingCity = billingcity;
        account.Phone = phone;
        insert account;
        return account;
    }
    
}