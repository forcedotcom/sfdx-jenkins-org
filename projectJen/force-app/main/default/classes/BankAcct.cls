public class BankAcct {
    private integer balance  = 150;
    public string acctname;
    
    public integer makedeposit(integer deposit) {
        balance  = balance+deposit;
        return balance;
    }

}