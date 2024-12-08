// Query for all related OpportunityContactRole
List<OpportunityContactRole> ocrs = [
    SELECT ID, ContactID, IsPrimary, OpportunityID 
    FROM OpportunityContactRole 
    WHERE OpportunityID in :opportunityIDsWithStagenameChanges
];

// Look for primary, or for no OCR on opportunities
Set<ID> primaryFound = new Set<ID>();
Set<ID> anyFound = new Set<ID>();
for(OpportunityContactRole ocr : ocrs) {
    if(ocr.IsPrimary) primaryFound.add(ocr.OpportunityID);
    anyFound.add(ocr.OpportunityID);
}

// Build list of opportunities with no contact role,
// and list with contact role but no primary contact role
// Use maps because it's an easy way to get the keyset for later queries
Map<ID, Opportunity> opsWithNoContactRoles = new Map<ID, Opportunity>();
Map<ID, Opportunity> opsWithNoprimary = new Map<ID, Opportunity>();

for(ID opid: opportunityIDsWithStagenameChanges) {
    if(!primaryFound.contains(opid)) {
        if(anyFound.contains(opid))
            opsWithNoprimary.put(opid, newMap.get(opid));
        else
            opsWithNoContactRoles.put(opid, newMap.get(opid))
    }
}