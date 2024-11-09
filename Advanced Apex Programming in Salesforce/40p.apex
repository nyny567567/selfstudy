// Query for contact info
List<Contact> cts = [SELECT ID, AccountID from Contact where your condition here];

// Some code that operates on the contacts here....

// Get list of account IDs.
Set<ID> accountIds = new Set<ID>();
for(Contact ct: cts)
    if(ct.AccountId != null) accountIds.add(ct.AccountID);

if(accountIds.size() > 0) {
    List<Account> accounts = [Select ID, AnnualRevenue from Account where ID in :accountIds];
    for(Account accountFound: accounts)
        if(accountFound.AnnualRevenue == null)
            accountFound.AnnualRevenue = 500;
    update accounts;
}

// Query for contact info and annual revenue on 
// account in a single query
List<Contact> cts = [SELECT ID, AccountID, Account.ID, Account.AnnualRevenue from Contact where your condition here];

// Some code that operates on the contacts here....

Map<ID, Account> accountsToUpdate = new Map<ID, Account>();

for(Contact ct: cts) {
    if(ct.Account.AnnualRevenue == null) {
        ct.Account.AnnualRevenue = 500;
        accountsToUpdate.put(ct.AccountID, ct.Account);
    }
}
if(accountsToUpdate.size() > 0) update accountsToUpdate.values();