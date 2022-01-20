trigger OppProdOnDelete on OpportunityLineItem (after delete) {

List<Deleted_Product__C> Opp_ins = new List<Deleted_Product__C>();

for (OpportunityLineItem Opp  : trigger.old){

Deleted_Product__C op = new Deleted_Product__C();

PriceBookEntry ProdID = [Select Product2ID from PriceBookEntry where ID  = :Opp.PricebookEntryId];
op.Product2__C = ProdID.Product2ID;
op.Opportunity__C = Opp.OpportunityId;
op.Quantity__C  = Opp.Quantity;
op.UnitPrice__C  = Opp.UnitPrice;
op.ServiceDate__C = Opp.ServiceDate;
op.Description__C = Opp.Description;

Opp_Ins.Add(op);
}
Database.Insert(Opp_ins);

}