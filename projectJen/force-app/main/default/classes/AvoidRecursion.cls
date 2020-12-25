public class AvoidRecursion {
private static boolean firstRun = true;
    public static boolean isFirstRun(){
    if(firstRun){
      firstRun = false;
      //this is a code to avoid recursion
      return true;
    }else{
        return firstRun;
    }
    }
}