for(Lead ld : leads) {
    switch on emailField {
        when 'email' {
            for(string spamDomain : spamList)
                if(ld.email!= null && ld.email.endsWithIgnoreCase(spamDomain))
                    results.add(ld);
        }
        when else {
            for(string spamDomain : spamList)
                if(ld.get(emailField) != null && ((String)ld.get(emailField)).endsWithIgnoreCase(spamDomain))
                    results.add(ld);
        }
    }
}

Boolean useStaticEmail = (emailField == 'email');
for(Lead ld : leads) {
    String email = (useStaticEmail)? ld.email : (String)ld.get(emailField);
    if(email!= null) {
        for(string spamDomain : spamList)
            if(email.endsWithIgnoreCase(spamDomain)) results.add(ld);
    }
}