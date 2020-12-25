public class Vision {

    public static String VISION_API = 'https://api.einstein.ai/v2/vision';
    public static String PREDICT = VISION_API + '/predict';

    public static List<Prediction> predictUrl(String url, String access_token, String model) {
        return predictInternal(url, access_token, model, false);
    }

    public static List<Prediction> predictBase64(String base64String, String access_token, String model) {
        return predictInternal(base64String, access_token, model, true);
    }

    public static List<Prediction> predictBlob(blob fileBlob, String access_token, String model) {
        return predictInternal(EncodingUtil.base64Encode(fileBlob), access_token, model, true);
    }

    private static List<Prediction> predictInternal(String sample, String access_token, String model, boolean isBase64) {
        string contentType = HttpFormBuilder.GetContentType();
        //  Compose the form
        string form64 = '';

        form64 += HttpFormBuilder.WriteBoundary();
        form64 += HttpFormBuilder.WriteBodyParameter('modelId', EncodingUtil.urlEncode(model, 'UTF-8'));
        form64 += HttpFormBuilder.WriteBoundary();
        if(isBase64) {
         form64 += HttpFormBuilder.WriteBodyParameter('sampleBase64Content', sample);
        } else {
         form64 += HttpFormBuilder.WriteBodyParameter('sampleLocation', sample);
        }
        form64 += HttpFormBuilder.WriteBoundary(HttpFormBuilder.EndingType.CrLf);

        blob formBlob = EncodingUtil.base64Decode(form64);
        string contentLength = string.valueOf(formBlob.size());
        //  Compose the http request
        HttpRequest httpRequest = new HttpRequest();

        httpRequest.setBodyAsBlob(formBlob);
        httpRequest.setHeader('Connection', 'keep-alive');
        httpRequest.setHeader('Content-Length', contentLength);
        httpRequest.setHeader('Content-Type', contentType);
        httpRequest.setMethod('POST');
        httpRequest.setTimeout(120000);
        httpRequest.setHeader('Authorization','Bearer ' + access_token);
        httpRequest.setEndpoint(PREDICT);

        Http http = new Http();
        List<Prediction> predictions = new List<Prediction>();
        try {
              HTTPResponse res = http.send(httpRequest);
              if (res.getStatusCode() == 200) {
                  System.JSONParser parser = System.JSON.createParser(res.getBody());
                  while (parser.nextToken() != null) {
                      if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'probabilities')) {
                          parser.nextToken();
                            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                                while (parser.nextToken() != null) {
                                    // Advance to the start object marker to
                                    //  find next probability object.
                                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                                        // Read entire probability object
                                        Prediction probability = (Prediction)parser.readValueAs(Vision.Prediction.class);
                                        predictions.add(probability);
                                    }
                                }
                            }
                      break;
                      }
                  }
              }
              //System.debug(res.toString());
              //System.debug('STATUS:'+res.getStatus());
              //System.debug('STATUS_CODE:'+res.getStatusCode());
         } catch(System.CalloutException e) {
                System.debug('ERROR:' + e);
         }
         return(predictions);
    }

    public class Prediction {
        public String label {get;set;}
        public Double probability {get;set;}
    }
}