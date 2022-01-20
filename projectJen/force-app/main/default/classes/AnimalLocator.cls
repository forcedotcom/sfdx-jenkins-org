public class AnimalLocator {
    
    public static HttpResponse getAnimalNameById(Integer animalId) {
        Http http = new Http();
    	HttpRequest request = new HttpRequest();
        Integer ID = animalId;
        String stendpoint = 'https://th-apex-http-callout.herokuapp.com/animals/'+ animalId;
    	request.setEndpoint(stendpoint);
    	request.setMethod('GET');
        system.debug(request);
    	HttpResponse response = http.send(request);
        system.debug(response.getBody());
        
        //if response is good - status code 200
    if(response.getStatusCode() == 200){
        //deserialize the JSON resoponse
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        //Cast the values in the animals key as a list
        Object animal = (object)results.get('animal');
        Map<String, Object> Attributes = (Map<String, Object>)animal;
        system.debug(Attributes.get('name'));
    }
        return response;
        
    }

}