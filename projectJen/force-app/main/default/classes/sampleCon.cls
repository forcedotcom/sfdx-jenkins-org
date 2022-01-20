public class sampleCon {
    String country = null;
         
    public PageReference test() {
        return null;
    }
                
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('US','US')); 
        options.add(new SelectOption('CANADA','Canada')); 
        options.add(new SelectOption('MEXICO','Mexico')); return options; 
    }
                   
    public String getCountry() {
        return country;
    }
                    
    public void setCountry(String country) { this.country = country; }
}