public class sample implements example {
    
    //Constructor example - Used for Initializing Variables/properties
    public string var1;
    public integer var2;
    public static integer num1 = 10; // can be changed thru class namw
    public static final integer num2 = 100; // cannot be changed. This is final
      
    public sample(string v1, Integer v2){
        var1 = v1;
        var2 = v2;
        
    }
    
    public Integer var3 {
		set { var3 = value; if (var3 < 0) var3 =0; }
        get { return var3; }
		
	}
    
    
	/* Uncomment here 
    private string var1;
    private integer var2;    
    
    //public method opens access for private variables
    //Variables declared as variables can be initialized or allowed R/W thru Public methods
    /*Ananymous Code
     	Sample objSam = new Sample();
		objSam.setvariables('TEXT', 1);
		System.debug('var1:' + objSam.getvar1() + '  objSam.var2:'+ objSam.getvar2());
    public void setvariables(string v1, integer v2) {
    var1 = v1;
    var2 = v2;
    }  */
    
    public String getvar1() {
    return var1;
    } 
    
    public Integer getvar2() {
    return var2;
    }  
}