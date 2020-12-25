public class RestCallOut {
    
    public static HttpResponse makeGetCallOut(){
    
    	Http http = new Http();
    	HttpRequest request = new HttpRequest();
    	request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    	request.setMethod('GET');
    	HttpResponse response = http.send(request);
        System.debug(response);
    
    //if response is good - status code 200
    if(response.getStatusCode() == 200){
        //deserialize the JSON resoponse
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        //Cast the values in the animals key as a list
        List<Object> animals = (List<object>)results.get('animals');
        system.debug('Received following animals:');
        for(Object animal : animals){
            system.debug(animal);
        }           
    	}
        return response;
    }
    
    public static HttpResponse makePostCallOut(){
        
        Http http = new Http();
    	HttpRequest request = new HttpRequest();
    	request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    	request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"new animal"}');
    	HttpResponse response = http.send(request);
        
        if(response.getStatusCode() != 201){
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + response.getStatus());
        }
        else {
            System.debug(response.getBody());
        }
        return response;
    }
}