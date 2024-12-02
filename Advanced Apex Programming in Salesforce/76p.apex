static testMethod void createTaskTest() {
    Integer numberOfOpportunities = 100;
    List<Opportunity> ops = new List<Opportunity>();
    for(Integer x=0; x<numberOfOpportunities; x++) {
        ops.add(new Opportunity(CloseDate = Date.Today().addDays(5), Name = 'optest_' + String.valueOf(x), StageName = 'prospecting'));
    }

    insert ops;

    Test.startTest();
    for(Opportunity op : ops) op.StageName = 'Qualification';
    update ops;
    Test.stopTest();

    List<Task> tasks = [SELECT ID, OwnerID, WhatID, Status, Subject, Type from Task where OwnerID = :UserInfo.getUserId() And Type='Other' And IsClosed = False And Subject = 'Assign Primary Contact'];
    system.assertEquals(numberOfOpportunities, tasks.size());
}