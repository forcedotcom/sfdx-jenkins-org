public class StringArrayTest {
    
    public static list<string> generateStringArray(Integer i){
        
        List<string> lststring = new List<String>();
        
        for(integer j=0 ; j <i; j++ ){
            lststring.add('Test '+j);
        }
        system.debug(lststring);
        return lststring;
    }

}