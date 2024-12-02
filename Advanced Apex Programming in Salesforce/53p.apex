for(Lead ld : leads) {
    String email = (useStaticEmail) ? ld.email : (String)ld.get(emailField);
    if(email!= null) {
        email = email.toLowerCase();
        for(string spamDomain : spamList)
            if(email.endsWith(spamDomain)) results.add(ld);
    }
}