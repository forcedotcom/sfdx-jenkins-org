public class ToasterClass implements KitchenUtilityClass{

    private String modelNumber;
    
        public ToasterClass(String themodelNumber){
        	modelNumber = themodelNumber;
    }
    
    public string getModelNumber(){
        return 'T' + modelNumber;
    }
}