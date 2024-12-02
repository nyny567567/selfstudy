List<Lead> leads = [Select ID, Company, LastName, Description from Lead];
for(Lead ld : leads) perform operation HttpRequest

for(List<Lead> leads : [Select ID, Company, LastName, Description from Lead]) {
    for(Lead ld : leads) perform operation here;
}

for(Lead ld : [Select ID, Company, LastName, Description from Lead]) perform operation here;