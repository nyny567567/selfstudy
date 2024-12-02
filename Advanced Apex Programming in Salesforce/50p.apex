private static Set<String> spamList = new Set<String>
    { '@yahoo.com', '@gmail.com', '@hatmail.com', 
    '@whitehouse.gov', '@test.com', '@nobody.com', '@abc.com', '@spam.com', '@xyz.com', '@ignoreme.com'};

// Dynamic field, test against each entry
private static List<Lead> checkForSpam1(List<Lead> leads, String emailField) {
    List<Lead> results = new List<Lead>();
    for(Lead ld : leads) {
        for(string spamDomain : spamList)
            if(ld.get(emailField) != null && ((String)ld.get(emailField)).endsWithIgnoreCase(spamDomain)) 
                results.add(ld);
    }
    return results;
}
