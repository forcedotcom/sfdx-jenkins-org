public class apexWorkbook {
    public static void loadData () {
        Merchandise__c[] ml = new List<Merchandise__c>();
        Merchandise__c m = new Merchandise__c(
                    Name='Pencils',
                    Description__c='Cool pencils',
                    Price__c=1.5,
                    Total_Inventory__c=1000);
        ml.add(m);
        Merchandise__c m2 = new Merchandise__c(
                    Name='Notebooks',
                    Description__c='Blue notebooks',
                    Price__c=4.5,
                    Total_Inventory__c=2000);
        ml.add(m2);
        insert ml;
 
        Invoice_Statement__c inv = new Invoice_Statement__c( 
          Description__c = 'Invoice 1');
        insert inv;

        Line_Item__c lineItem = new Line_Item__c( 
          Name = '1',
          Invoice_Statement__c = inv.Id,
          Merchandise__c = m.Id, 
          Unit_Price__c = m.Price__c, 
          Units_Sold__c = 5);
        insert lineItem;
    }
}