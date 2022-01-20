trigger duplicateAccChk on Account (before insert) {

Set<String> setAccName = new Set<String>();

for (Account a  : trigger.new){
setAccName.add(a.Name); //Add all the unique values using set
}

Map<String, Id> mapAccount=new Map<String, ID>();
//loop thru each set values in Acc and add it to Map 
for (Account acct : [SELECT Name, ID FROM Account WHERE Name IN :SetAccName]){
mapAccount.put(acct.Name, acct.ID);
}


for (Account acc  : trigger.new){
//Compare Original Acc Name with those added in the Map
if (mapAccount.containskey(acc.Name)) {
acc.addError('There are one more Account(s) with the same name');
}

}
}