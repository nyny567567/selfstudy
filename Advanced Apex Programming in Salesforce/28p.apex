User u = [Select UserIsSpecial__c from User
            Where ID =:UserInfo.getUserId()];
Boolean ueserIsSpecial = u.UserIsSpecial__c;

public class ThinkingInApex {
    
    private static Boolean isUserSpecialChecked = false;
    private static Boolean userIsSpecial = false;

    public static Boolean isUserSpecial()
    {
        if((isUserSpecialChecked) return userIsSpecial;

        User u = [Select UserIsSpecial__c from User
                where ID = :UserInfo.getUserId()];
        userIsSpecial = u.UserIsSpecial__c;
        isUserSpecialChecked = true;
        return userIsSpecial;
    }
}