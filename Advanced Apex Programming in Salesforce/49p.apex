List<List<Integer>> numbers = new List<List<Integer>>();
List<Integer> emptyList = new List<Integer>();
markReferenceStartTime();
for(Integer x = 0; x<1000000; x++) {
    numbers.add(emptyList);
}
markReferenceEndTIme();
markTargetStartTime();
for(Integer x = 0; x<1000000; x++) {
    numbers.add(new List<Integer>{x}); // Add a new list
}

markReferenceStartTime();
for(Integer x = 0; x<1; x++) {
    Map<String, Schema.SObjectType> describeInfo = Schema.getGlobalDescribe();
}
markReferenceEndTime();
markTargetStartTime();
for(Integer x = 0; x<1000; x++) {
    Map<String, Schema.SObjectType> describeInfo = Schema.getGlobalDescribe();
}
reportResults(1000);