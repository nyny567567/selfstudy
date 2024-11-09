@testvisible
private static Boolean fakeAccountInsertionException = false;

try {
    if(fakeAccountInsertionException)
        accounts.values().get(0).First_Contact_Email__c = 'hello';
    update accounts.values();
} catch (Exception ex) 