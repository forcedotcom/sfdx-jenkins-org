global class wbsGCILookup {
    webservice static String GCILookup(String AccountNum){
       SObject[] a = [select GCINumber__c from GCILookup__c where AccountNumber__c  =: AccountNum Limit 1]; //.GCINumber__c; 
        IF (a.size() == 0 ){
           return '9999999999' ;
        }   else    {          
       		return (String)a.get(0).get('GCINumber__c');
    }
}
    
}