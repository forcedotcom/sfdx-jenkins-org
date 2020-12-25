@isTest
private class TestInvoiceStatementDeletion {
static testmethod void TestDeleteInvoiceWithLineItem() {
// Create an invoice statement with a line item then try to delete it
Invoice_Statement__c inv = TestDataFactory.createOneInvoiceStatement(true);
Test.startTest();
Database.DeleteResult result = Database.delete(inv, false);
Test.stopTest();
// Verify invoice with a line item didn't get deleted.
System.assert(!result.isSuccess());
}
static testmethod void TestDeleteInvoiceWithoutLineItems() {
// Create an invoice statement without a line item and try to delete it
Invoice_Statement__c inv = TestDataFactory.createOneInvoiceStatement(false);
Test.startTest();
Database.DeleteResult result = Database.delete(inv, false);
Test.stopTest();
// Verify invoice without line items got deleted.
System.assert(result.isSuccess());
}
static testmethod void TestBulkDeleteInvoices() {
// Create two invoice statements, one with and one with out line items
// Then try to delete them both in a bulk operation, as might happen
// when a trigger fires.
List<Invoice_Statement__c> invList = new List<Invoice_Statement__c>();
invList.add(TestDataFactory.createOneInvoiceStatement(true));
invList.add(TestDataFactory.createOneInvoiceStatement(false));
Test.startTest();
Database.DeleteResult[] results = Database.delete(invList, false);
Test.stopTest();
// Verify the invoice with the line item didn't get deleted
System.assert(!results[0].isSuccess());
// Verity the invoice without line items did get deleted.
System.assert(results[1].isSuccess());
}
}