@isTest
private class RestCallOutTest {
    
    static testmethod void testGetCallOut(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        //Associate the callout with a mock response
        Test.setMock(HttpCallOutMock.class, mock);
        //Call method to test
        HttpResponse result  = RestCallOut.makeGetCallOut();
        //verify mock response is not null
        System.assertNotEquals(null,result,'The callout returned a null response.');
        //Verify the Status Code
        System.assertEquals(200, result.getStatusCode());
        //Verify Content Type
        System.assertEquals('application/json;charset=UTF-8',result.getHeader('Content-Type'),'The content type value is not expected.');
        //Verify the array contains 3 items
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        System.assertEquals(3, animals.size(),'The array should only contain 3 items.');  
    }
    

}