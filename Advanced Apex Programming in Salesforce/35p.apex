ThinkingInApex.fakeAccountInsertionException = true;
insert contacts;

system.assertNotEquals(ct.LastName, actToTest.First_Contact_Name__c);
system.assertNotEquals(ct.Email, actToTest.First_Contact_Email__c);

public static Boolean disableContactTriggers = false;