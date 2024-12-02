private static Set<String> spamDomainsList = new Set<String> {
    'yahoo.com', 'gmail.com', 'hotmail.com', 'whitehouse.gov', 'test.com', 'nobody.com', 'abc.com', 'spam.com', 'xyz.com', 'ignoreme.com'
};

for(Lead ld : leads) {
    String email = (useStaticEmail) ? ld.email : (String)ld.get(emailField);
    String emaildomain = email?.substringAfter('@')?.toLowerCase();
    if(emaildomain != null) {
        if(spamDomainList.contains(emaildomain)) results.add(ld);
    }
}