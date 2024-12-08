public static void afterUpdateOpportunityCommon(List<Opportunity> newList, Map<ID, Opportunity> newMap, Map<ID, Opportunity> oldMap) {
    // Pattern 2 - Straightforward common implementation

    Set<ID> opportunityIDsWithStagenameChanges = new Set<ID>();

    // Get OpportunityContactRoles
    for(Opportunity op : newList) {
        if(op.Stagename != oldMap.get(op.id).StageName) 
            opportunityIDsWithStagenameChanges.add(op.Id);
    }

    // Quick exit if no processing required
    if(opportunityIDsWithStagenameChanges.size() == 0) return;
}