@isTest
private class TestVerifyDate {
    
     @isTest static void checkinrange(){
        
       	date datetoday = Date.Today();
    	date dateinrange = Date.Today()+5;
        
        date result = VerifyDate.CheckDates(datetoday,dateinrange);
        system.assertEquals(dateinrange,result);
               
    }

   @isTest static void checkoutofrange(){
        
        date datetoday = Date.Today();
    	date dateoutofrange = Date.Today()+40;
        
        date result1 =  VerifyDate.CheckDates(datetoday,dateoutofrange);
        system.assertNotEquals(dateoutofrange, result1);
               
    }
}