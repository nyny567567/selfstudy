// Prepare the specified number of opportunities, 
// with contact roles on each.
// The contact roles are distributed evenly among the number of contacts specified.
public static void initTestObjects( List<Opportunity> newOpportunities, Integer numberOfOpportunities, Integer numberOfOtherOpportunities, Integer ContactRolesPerOp, Integer numberOfContacts) {
    if(numberOfContacts < contactRoleslPerOp) numberOfContacts = contactRolesPerOp;
    List<Contact>cts = new List<Contact>();
    for(Integer x=0; x<numberOfContacts; x++) {
        cts.add(new Contact(LastName = 'cttest_' + String.valueOf(x)));
    }
    insert cts;
}

newOpportunities.clear();
for(Integer x=0; x<numberOfOpportunities; x++) {
    newOpportunities.add(new Opportunity(CloseDate = Date.Today().addDays(5), Name = 'optest_' + String.valueOf(x), StageName = 'Prospecting'));
}

// Insert the test opportunities
insert newOpportunities;

List<Opportunity> otherOpportunities = new List<Opportunity>();
for(Integer x=0; x<numberOfOtherOpportunities; x++) {
    otherOpportunities.add(new Opportunity(CloseDate = Date.Today().addDays(5), Name = 'otherops_' + String.valueOf(x + numberOfOpportunities), StageName = 'Prospecting'));
}
insert otherOpportunities;
// Combine the two for creating OpportunityContactRoles
otherOpportunities.addAll(newOpportunities);

// Now insert contact roles
List<OpportunityContactRole> ocrList = new List<OpportunityContactRole>();
Integer contactNumber = 0;
for(Opportunity op : otherOpportunities) {
    for(Integer ocrNumber = 0; ocrNumber < contactRolesPerOp; ocrNumber++) {
        ocrList.add(new OpportunityContactRole(OpportunityID = op.id, ContactID = cts[contactNumber].id));
        contactNumber++;
        if(contactNumber >= numberOfContacts) contactNumber = 0;
    }
    insert ocrList;
}