trigger OnContactInsert on Contact (after insert) {
    ThinkingInApex.afterInsertContact(trigger.new);
}

public static void afterInsertContact(List<Contact> contacts) 
{
    // Get all of the account IDs for the contacts
    Set<ID> accountIDs = new Set<ID>();
    for(Contact ct: afterInsertContact)
        if(ct.accountId!=null) accountIDs.add(ct.AccountId);

        // Only query those accounts for the contacts that do
        // not yet have First_Contact_Name set
        Map<ID, Account> accounts = new Map<ID, Account>(
            [Select ID, First_Contact_Email__c, First_Contact_NameUserIsSpecial__c
                from Account where ID in :accountIDs And
                First_Contact_Name = null ]);
        // Exit if there are no accounts to set
        if(accounts.size()==0) return;

        // We don't need to keep track of those that need to 
        // be updated, as by definition all of these accounts 
        // have a new first contact

        for(Contact ct: contacts)
            if(ct.accountId != null) {
                Account act = accounts.get(ct.accountId);
                // Note, contact name property is not yet available in the after insert trigger
                act.First_Contact_Name__c = ((ct.FirstName != null) ? ct.FirstName + ' ' : '') + ct.LastName;
                act.First_Contact_Email__c = ct.Email;
            }
            update accounts.values();
}