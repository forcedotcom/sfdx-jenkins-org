public class FridgeClass implements KitchenUtilityClass {
    
    private String modelNumber;
    private Integer numberinStock;
    public static final Integer stockThreshold = 5;
    
    public Integer ecoRating {
            get { return ecoRating; }
            set { ecoRating = value; if (ecoRating < 0) ecoRating =0; }
}
    
    public FridgeClass(){
        	modelNumber = 'XXXXX';
        	numberinStock = 0;
    }
    
    public FridgeClass(String themodelNumber, Integer thenumberinStock){
        	modelNumber = themodelNumber;
        	numberinStock = thenumberinStock;
    }
    
    public void setmodelNumber(String themodelNumber){
        modelNumber = themodelNumber;
    }
    
    public String getmodelNumber(){
        return modelNumber;
    }
    
    public static void toDebug(FridgeClass aFridge){
        System.debug('Model Number: ' + aFridge.modelNumber);
        System.debug('Number in Stock: ' + aFridge.numberinStock);
    }
    
    public void updatestock(integer justsold) {
        numberinstock = numberinstock - justsold;
    }
}