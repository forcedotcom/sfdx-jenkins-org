public class MyExtension {
private final Account acct;
public MyExtension(ApexPages.StandardController controller) {
this.acct = (Account)controller.getRecord();
}
public String getTitle() {
return 'Account: ' + acct.name + ' (' + acct.id + ')';
}
}