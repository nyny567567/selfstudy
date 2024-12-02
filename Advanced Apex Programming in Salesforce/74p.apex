public static void validateOCRs(List<Opportunity> ops) {
    // Get map for IDs
    Map<ID, Opportunity> opMap = new Map<ID, Opportunity>(ops);

    // Query for primary Contacts
    List<OpportunityContactRole> ocrs = [SELECT ID, OpportunityID from OpportunityContactRole where OpportunityID in :opMap.keyset() And Isprimary = true];

    // Create set of opportunity IDs with primary contacts
    Set<ID> opportunitiesWithPrimaryContact = new Set<ID>();
    for(OpportunityContactRole ocr : ocrs) opportunitiesWithPrimaryContact.add(ocr.OpportunityID);

    // Now make sure every opportunity has a primary contact role
    for(Opportunity op : ops) System.Assert(opportunitiesWithPrimaryContact.contains(op.id));
}

List<Opportunity> opResults = [SELECT ID, (SELECT ID from OpportunityContactRoles where IsPrimary = true) from opportunity where ID in :opmap.keyset()];

for(Opportunity op : opResults) System.Assert(op.OpportunityContactRoles.size() == 1);
}

static testMethod void bulkOpportunityTest() {
    List<Opportunity> ops = new List<Opportunity>();
    // Note, you may need to adjust these numbers
    initTestObjects(ops, 100, 15, 15, 40);

    Test.startTest();
    for(Opportunity op : ops) op.StageName = 'Qualification';
    update ops;
    Test.stopTest();

    validateOCRs(ops);
}