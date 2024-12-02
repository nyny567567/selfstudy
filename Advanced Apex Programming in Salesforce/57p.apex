public static void InitializeCache() {
    cache.org.remove('describeinfo');
    cache.org.remove('userinfo');
    cache.org.remove('numberslist');
    cache.org.remove('numbersstring');
    Cache.org.put('describeinfo', Schema.getGlobalDescribe());
    User u = [Select ID, IsActive, Name from User where ID = :userinfo.getUserId()];
    cache.org.put('userinfo', u);

    List<String> numbers = new List<String>();
    for(Integer x = 0; x<10000 ; x++) numbers.add(string.valueOf(x));
    cache.org.put('numberslist', numbers);
    cache.org.put('numbersstring', string.join(numbers, ','));
}

public static void MeasurePerformance() {
    System.debug(LoggingLevel.ERROR, 'Single Global Describe');
    markReferenceStartTime();
    Map<String, Schema.SObjectType> describeinfo = Schema.getGlobalDescribe();
    markReferenceEndTime();
    markTargetStartTime();
    describeinfo = (Map<String, Schema.SObjectType>) Cache.org.get('describeinfo');
    markTargetEndTime();
    reportResults(1);

    System.debug(LoggingLevel.ERROR, 'Single User object');
    markReferenceStarTime();
    User u = [Select ID, IsActive, Name from User where ID = :userinfo.getUserId()];
    markReferenceEndTime();
    reportResults(1);

    System.debug(LoggingLevel.ERROR, 'List of numbers vs numbers string');
    markReferenceEndTime();
    markTargetStartTime();
    String numbersstring = (String)Cache.org.get('numbersstring');
    //List<String> numstringlist = numbersstring.split(',');
    // If you uncomment this, the time almost exactly matches the numberlist
    markTargetEndTime();
    reportResults(25000);
}